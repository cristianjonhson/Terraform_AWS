# Crear una instancia EC2
resource "aws_instance" "free_tier_instance" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.security_group_id]
  associate_public_ip_address = true # Asignar una dirección IPv4 pública a la instancia

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = var.metadata_http_tokens_required ? "required" : "optional"
  }

  root_block_device {
    encrypted   = var.root_volume_encrypted
    volume_size = var.root_volume_size
    volume_type = var.root_volume_type
  }

  tags = {
    Name = var.name
  }
}
