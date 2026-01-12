# AWS Infrastructure as Code (IaC) - Enterprise Standard 2026

![Terraform](img.shields.io)
![AWS](img.shields.io)

## ��� Propósito del Proyecto
Este repositorio contiene una estructura profesional de infraestructura automatizada en AWS utilizando **Terraform**. El diseño sigue el principio **DRY (Don't Repeat Yourself)** y está preparado para escalar en entornos corporativos mediante el uso de módulos personalizados y gestión de estado remoto.

## ���️ Arquitectura
La infraestructura despliega:
- **Networking:** VPC personalizada, Subnet Pública, Internet Gateway y Tablas de Ruteo.
- **Compute:** Instancias EC2 (Amazon Linux 2023) con Security Groups configurados para tráfico web (Puerto 80).
- **Seguridad:** Aislamiento de recursos y gestión de estado cifrado.

## ��� Estructura del Repositorio
```text
.
├── modules/                # Módulos reutilizables (Core)
│   ├── vpc/                # Lógica de Red aislada
│   └── ec2/                # Configuración de Servidores
├── environments/           # Orquestación por entornos
│   ├── dev/                # Entorno de Desarrollo (Sandbox)
│   └── prod/               # Entorno de Producción (Hardened)
├── scripts/                # Automatización de tareas
└── versions.tf             # Definición de proveedores (AWS v5.0+)

