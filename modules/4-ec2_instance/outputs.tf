
# Output para la ID de la instancia EC2 creada
output "instance_id" {
  description = "ID de la instancia EC2 creada"
  value       = aws_instance.free_tier_instance.id
}

# Output para la dirección IP pública de la instancia EC2
output "public_ip" {
  description = "Dirección IP pública de la instancia EC2"
  value       = aws_instance.free_tier_instance.public_ip
}
