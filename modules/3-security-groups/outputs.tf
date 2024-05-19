# Output para la ID del grupo de seguridad creado
output "security_group_id" {
  description = "ID del grupo de seguridad creado"
  value       = aws_security_group.free_tier_sg.id
}