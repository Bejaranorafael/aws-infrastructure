variable "project_name" {
  description = "Nombre del proyecto para los tags"
  type        = string
}

variable "region" {
  description = "Región de AWS"
  type        = string
}

variable "vpc_cidr" {
  description = "Rango CIDR para la VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "Rango CIDR para la subred pública"
  type        = string
}

