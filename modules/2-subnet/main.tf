# Crear una subred pública
resource "aws_subnet" "free_tier_subnet" {
  vpc_id            = var.vpc_id
  cidr_block        = var.subnet_cidr
  availability_zone = var.availability_zone

  tags = {
    Name = "free-tier-subnet"
  }
}