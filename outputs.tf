# Output para la ID de la VPC creada
output "vpc_id" {
  description = "ID de la VPC creada"
  value       = module.vpc.vpc_id
}

# Output para la ID de la subred pública creada
output "subnet_id" {
  description = "ID de la subred pública creada"
  value       = module.subnet.subnet_id
}

# Output para la ID de la puerta de enlace de internet creada
output "igw_id" {
  description = "ID de la puerta de enlace de internet creada"
  value       = module.internet_gateway.igw_id
}

# Output para la ID de la tabla de rutas creada
output "route_table_id" {
  description = "ID de la tabla de rutas creada"
  value       = module.route_table.route_table_id
}

# Output para la ID del grupo de seguridad creado
output "security_group_id" {
  description = "ID del grupo de seguridad creado"
  value       = module.security_group.security_group_id
}

# Output para la ID de la instancia EC2 creada
output "instance_id" {
  description = "ID de la instancia EC2 creada"
  value       = module.ec2_instance.instance_id
}

# Output para la dirección IP pública de la instancia EC2
output "public_ip" {
  description = "Dirección IP pública de la instancia EC2"
  value       = module.ec2_instance.public_ip
}