# Output para la ID de la subred pública creada
output "subnet_id" {
  description = "ID de la subred pública creada"
  value       = aws_subnet.free_tier_subnet.id
}