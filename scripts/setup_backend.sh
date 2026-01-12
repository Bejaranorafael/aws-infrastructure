#!/bin/bash

# ==============================================================================
# Script de Configuraci√≥n de Backend Remoto para Terraform
# Este script crea un Bucket S3 para el estado y una tabla DynamoDB para el lock.
# ==============================================================================

# --- VARIABLES (C√°mbialas seg√∫n tu preferencia) ---
BUCKET_NAME="mi-proyecto-personal-tfstate-2026" # Debe ser √∫nico a nivel mundial
REGION="us-east-1"
TABLE_NAME="terraform-lock"

echo "Ì∫Ä Iniciando configuraci√≥n de backend en AWS ($REGION)..."

# 1. Crear el Bucket S3
echo "Ì≥¶ Creando bucket S3: $BUCKET_NAME..."
aws s3api create-bucket \
    --bucket $BUCKET_NAME \
    --region $REGION \
    --create-bucket-configuration LocationConstraint=$REGION 2>/dev/null

# Si la regi√≥n es us-east-1, el comando anterior puede fallar con LocationConstraint. 
# Si falla, intentamos el comando simple:
if [ $? -ne 0 ]; then
    aws s3api create-bucket --bucket $BUCKET_NAME --region $REGION
fi

# 2. Habilitar Versionado (Best Practice para recuperar estados anteriores)
echo "Ì¥Ñ Habilitando versionado en el bucket..."
aws s3api put-bucket-versioning \
    --bucket $BUCKET_NAME \
    --versioning-configuration Status=Enabled

# 3. Cifrado del Bucket (Seguridad)
echo "Ì¥ê Configurando cifrado AES256 por defecto..."
aws s3api put-bucket-encryption \
    --bucket $BUCKET_NAME \
    --server-side-encryption-configuration '{
        "Rules": [
            {
                "ApplyServerSideEncryptionByDefault": {
                    "SSEAlgorithm": "AES256"
                }
            }
        ]
    }'

# 4. Crear Tabla DynamoDB para State Locking (Evita escrituras simult√°neas)
echo "Ì¥ë Creando tabla DynamoDB: $TABLE_NAME..."
aws dynamodb create-table \
    --table-name $TABLE_NAME \
    --attribute-definitions AttributeName=LockID,AttributeType=S \
    --key-schema AttributeName=LockID,KeyType=HASH \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --region $REGION 2>/dev/null

echo "‚úÖ Configuraci√≥n finalizada."
echo "‚ö†Ô∏è  RECUERDA: Actualiza el nombre del bucket '$BUCKET_NAME' en todos tus archivos 'backend.tf'."

