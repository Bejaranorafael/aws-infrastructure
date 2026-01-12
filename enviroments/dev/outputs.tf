output "vpc_id" {
  description = "ID de la VPC creada"
  value       = module.networking.vpc_id
}

output "public_ip" {
  description = "Dirección IP pública del servidor"
  value       = module.compute.instance_public_ip # 
}

