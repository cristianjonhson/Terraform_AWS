# Variable para el CIDR block de la VPC
variable "vpc_cidr" {
  description = "CIDR block for the VPC"  # Descripción de la variable
  default     = "10.0.0.0/16"             # Valor por defecto para el CIDR block de la VPC
}

# Variable para el CIDR block de la subred pública
variable "subnet_cidr" {
  description = "CIDR block for the public subnet"  # Descripción de la variable
  default     = "10.0.1.0/24"                       # Valor por defecto para el CIDR block de la subred
}

# Variable para la zona de disponibilidad de la subred
variable "availability_zone" {
  description = "Availability zone for the subnet"  # Descripción de la variable
  default     = "us-east-1a"                        # Valor por defecto para la zona de disponibilidad
}

# Variable para el ID de la AMI (Amazon Machine Image) de la instancia EC2
variable "ami_id" {
  description = "AMI ID for the EC2 instance"       # Descripción de la variable
  default     = "ami-0c0b74d29acd0cd97"             # Valor por defecto para el ID de la AMI
}

# Variable para el tipo de instancia EC2
variable "instance_type" {
  description = "EC2 instance type"                 # Descripción de la variable
  default     = "t2.micro"                          # Valor por defecto para el tipo de instancia

}

# Variable para el puerto SSH
variable "ssh_port" {
  description = "Port for SSH access"
  default     = 22
}

# Variable para el puerto HTTP
variable "http_port" {
  description = "Port for HTTP access"
  default     = 80
}

# Variable para el puerto HTTPS
variable "https_port" {
  description = "Port for HTTPS access"
  default     = 443
}

# Variable para la dirección IP permitida para acceder por SSH a la instancia EC2
variable "ssh_ip" {
  description = "IP address allowed to SSH into the EC2 instance"  # Descripción de la variable
  default     = "192.168.0.11/32"                                  # Valor por defecto para la dirección IP permitida
}

# Variable para el rango de direcciones IP del servicio Conexión de instancias de EC2
variable "ec2_connect_ips" {
  description = "IP range for EC2 Instance Connect service"  # Descripción de la variable
  default     = "18.206.107.24/29"                           # Valor por defecto para el rango de direcciones IP
}

# Variable para el CIDR block que permite todo el tráfico
variable "all_traffic_cidr" {
  description = "CIDR block to allow all traffic"  # Descripción de la variable
  default     = "0.0.0.0/0"                        # Valor por defecto para permitir todo el tráfico
}