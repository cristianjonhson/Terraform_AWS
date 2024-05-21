output "igw_id" {
  description = "ID de la puerta de enlace de internet creada"
  value       = aws_internet_gateway.free_tier_igw.id
}