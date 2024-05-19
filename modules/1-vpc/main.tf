# Crear una VPC
resource "aws_vpc" "free_tier_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "free-tier-vpc"
  }
}