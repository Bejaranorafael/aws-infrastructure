output "vpc_id" {
  description = "ID de la VPC creada"
  value       = module.networking.vpc_id
}

output "public_ip" {
  description = " IP pública del servidor"
  value       = module.compute.instance_public_ip # Asegúrate de añadir este output en el módulo ec2
}

