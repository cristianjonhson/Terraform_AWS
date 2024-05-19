# Crear una instancia EC2
resource "aws_instance" "free_tier_instance" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.free_tier_subnet.id
  associate_public_ip_address = true  # Asignar una dirección IPv4 pública a la instancia
  vpc_security_group_ids      = [aws_security_group.free_tier_sg.id]

  tags = {
    Name = "free-tier-instance"
  }
}
