output "instance_id" {
  description = "ID único de la instancia EC2 creada"
  value       = aws_instance.web.id
}

output "instance_public_ip" {
  description = "Dirección IP pública de la instancia para acceso externo"
  value       = aws_instance.web.public_ip
}

output "instance_private_ip" {
  description = "Dirección IP privada de la instancia dentro de la red local"
  value       = aws_instance.web.private_ip
}

output "security_group_id" {
  description = "ID del Security Group asociado a la instancia"
  value       = aws_security_group.web_sg.id
}

