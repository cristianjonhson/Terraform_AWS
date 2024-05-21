provider "aws" {
  region = "us-east-1"
}

# Crear una VPC
module "vpc" {
  source  = "./modules/1-vpc"
  vpc_cidr = var.vpc_cidr
  name    = "free-tier-vpc"
}

# Crear una subred pública
module "subnet" {
  source             = "./modules/2-subnet"
  vpc_id             = module.vpc.vpc_id
  subnet_cidr        = var.subnet_cidr
  availability_zone  = var.availability_zone
  name               = "free-tier-subnet"
}

# Crear una puerta de enlace de internet
module "internet_gateway" {
  source  = "./modules/5-internet_gateway"
  vpc_id  = module.vpc.vpc_id
  name    = "free-tier-igw"
}

# Crear una tabla de rutas
module "route_table" {
  source           = "./modules/6-route_table"
  vpc_id           = module.vpc.vpc_id
  igw_id           = module.internet_gateway.igw_id
  all_traffic_cidr = var.all_traffic_cidr
  name             = "free-tier-route-table"
}

# Asociar la tabla de rutas a la subred
resource "aws_route_table_association" "free_tier_route_table_association" {
  subnet_id      = module.subnet.subnet_id
  route_table_id = module.route_table.route_table_id
}

# Crear un grupo de seguridad
module "security_group" {
  source           = "./modules/3-security-groups"
  vpc_id           = module.vpc.vpc_id
  ssh_port         = var.ssh_port
  http_port        = var.http_port
  https_port       = var.https_port
  ssh_ip           = var.ssh_ip
  ec2_connect_ips  = var.ec2_connect_ips
  all_traffic_cidr = var.all_traffic_cidr
  name             = "free-tier-sg"
}

# Crear una instancia EC2
module "ec2_instance" {
  source             = "./modules/4-ec2_instance"
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  subnet_id          = module.subnet.subnet_id
  security_group_id  = module.security_group.security_group_id
  name               = "free-tier-instance"
}
