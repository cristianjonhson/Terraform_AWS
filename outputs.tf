# Output para la ID de la VPC creada
output "vpc_id" {
  value = aws_vpc.free_tier_vpc.id
}

# Output para la ID de la subred pública creada
output "subnet_id" {
  value = aws_subnet.free_tier_subnet.id
}

# Output para la ID de la puerta de enlace de internet creada
output "igw_id" {
  value = aws_internet_gateway.free_tier_igw.id
}

# Output para la ID de la tabla de rutas creada
output "route_table_id" {
  value = aws_route_table.free_tier_route_table.id
}

# Output para la ID del grupo de seguridad creado
output "security_group_id" {
  value = aws_security_group.free_tier_sg.id
}

# Output para la ID de la instancia EC2 creada
output "instance_id" {
  value = aws_instance.free_tier_instance.id
}

# Output para la dirección IP pública de la instancia EC2
output "public_ip" {
  value = aws_instance.free_tier_instance.public_ip
}
