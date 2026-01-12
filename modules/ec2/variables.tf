variable "project_name" {
  description = "Nombre del proyecto"
  type        = string
}

variable "vpc_id" {
  description = "El ID de la VPC donde se creará el Security Group"
  type        = string
}

variable "subnet_id" {
  description = "El ID de la subred donde se desplegará la instancia"
  type        = string
}

variable "instance_type" {
  description = "Tipo de instancia"
  type        = string
  default     = "t3.micro"
}

variable "ami_id" {
  description = "ID de la AMI "
  type        = string
}

