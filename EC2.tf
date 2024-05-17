provider "aws" {
  region = "us-east-1"
}

# Crear una VPC
resource "aws_vpc" "free_tier_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "free-tier-vpc"
  }
}

# Crear una subred pública
resource "aws_subnet" "free_tier_subnet" {
  vpc_id            = aws_vpc.free_tier_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "free-tier-subnet"
  }
}

# Crear una puerta de enlace de internet
resource "aws_internet_gateway" "free_tier_igw" {
  vpc_id = aws_vpc.free_tier_vpc.id

  tags = {
    Name = "free-tier-igw"
  }
}

# Crear una tabla de rutas
resource "aws_route_table" "free_tier_route_table" {
  vpc_id = aws_vpc.free_tier_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.free_tier_igw.id
  }

  tags = {
    Name = "free-tier-route-table"
  }
}

# Asociar la tabla de rutas a la subred
resource "aws_route_table_association" "free_tier_route_table_association" {
  subnet_id      = aws_subnet.free_tier_subnet.id
  route_table_id = aws_route_table.free_tier_route_table.id
}

# Crear un grupo de seguridad
resource "aws_security_group" "free_tier_sg" {
  vpc_id = aws_vpc.free_tier_vpc.id
  description = "Example security group for SSH and HTTP access"

   ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks     = ["192.168.0.11/32"]  # Permitir tráfico HTTP desde cualquier dirección IP
  }

   ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Permitir tráfico HTTP desde cualquier dirección IP
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Permitir tráfico HTTPS desde cualquier dirección IP
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  # Permitir todo el tráfico de salida
  }

  tags = {
    Name = "free-tier-sg"
  }
}

# Crear una instancia EC2
resource "aws_instance" "free_tier_instance" {
  ami           = "ami-0c0b74d29acd0cd97" # Cambia esto si necesitas una AMI diferente
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.free_tier_subnet.id
  associate_public_ip_address = true  # Asignar una dirección IPv4 pública a la instancia

  tags = {
    Name = "free-tier-instance"
  }
}
