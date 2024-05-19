# Output para la ID de la VPC creada
output "vpc_id" {
  description = "ID de la VPC creada"
  value       = aws_vpc.free_tier_vpc.id
}
