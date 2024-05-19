# Crear un grupo de seguridad
resource "aws_security_group" "free_tier_sg" {
  vpc_id      = aws_vpc.free_tier_vpc.id
  description = "Example security group for SSH and HTTP access"

  # Permitir tráfico SSH desde una dirección IP específica y desde el servicio de Conexión de instancias de EC2
  ingress {
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    cidr_blocks = concat([var.ssh_ip], [var.ec2_connect_ips])
  }

  # Permitir tráfico HTTP y HTTPS desde cualquier dirección IP
  ingress {
    from_port   = var.http_port
    to_port     = var.http_port
    protocol    = "tcp"
    cidr_blocks = [var.all_traffic_cidr]  # Permitir tráfico HTTP desde cualquier dirección IP
  }

  ingress {
    from_port   = var.https_port
    to_port     = var.https_port
    protocol    = "tcp"
    cidr_blocks = [var.all_traffic_cidr]  # Permitir tráfico HTTPS desde cualquier dirección IP
  }

  # Permitir todo el tráfico de salida
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.all_traffic_cidr]  # Permitir todo el tráfico de salida
  }

  tags = {
    Name = "free-tier-sg"
  }
}