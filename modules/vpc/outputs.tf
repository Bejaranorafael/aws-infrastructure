output "vpc_id" {
  description = "ID de la VPC creada"
  value       = aws_vpc.this.id
}

output "public_subnet_id" {
  description = "ID de la subred pública"
  value       = aws_subnet.public.id
}

