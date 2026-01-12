#!/bin/bash
echo "Limpiando archivos temporales de Terraform..."
find . -type d -name ".terraform" -prune -exec rm -rf {} \;
find . -type f -name "*.tfstate*" -exec rm -rf {} \;
echo "Limpieza completada."

