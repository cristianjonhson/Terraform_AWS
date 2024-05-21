# Crear una instancia EC2
resource "aws_internet_gateway" "free_tier_igw" {
  vpc_id = var.vpc_id

  tags = {
    Name = var.name
  }
}