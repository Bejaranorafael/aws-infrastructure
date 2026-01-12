# Configuración para Producción
provider "aws" {
  region = var.region
}

module "networking" {
  source             = "../../modules/vpc"
  project_name       = "${var.project_name}-prod"
  region             = var.region
  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
}

module "compute" {
  source        = "../../modules/ec2"
  project_name  = "${var.project_name}-prod"
  vpc_id        = module.networking.vpc_id
  subnet_id     = module.networking.public_subnet_id
  instance_type = var.instance_type
  ami_id        = var.ami_id
}

