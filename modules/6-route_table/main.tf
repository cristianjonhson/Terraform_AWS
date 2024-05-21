resource "aws_route_table" "free_tier_route_table" {
  vpc_id = var.vpc_id

  route {
    cidr_block = var.all_traffic_cidr
    gateway_id = var.igw_id
  }

  tags = {
    Name = var.name
  }
}