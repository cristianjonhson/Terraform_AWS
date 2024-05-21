# Crear una instancia EC2
resource "aws_instance" "free_tier_instance" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.security_group_id]
  associate_public_ip_address = true  # Asignar una dirección IPv4 pública a la instancia

  tags = {
    Name = var.name
  }
}
