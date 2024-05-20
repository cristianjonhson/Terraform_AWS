variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "ssh_port" {
  description = "Port for SSH access"
  type        = number
}

variable "http_port" {
  description = "Port for HTTP access"
  type        = number
}

variable "https_port" {
  description = "Port for HTTPS access"
  type        = number
}

# Variable para la dirección IP permitida para acceder por SSH a la instancia EC2
variable "ssh_ip" {
  description = "IP address allowed to SSH into the EC2 instance"
  type        = string
}

# Variable para el rango de direcciones IP del servicio Conexión de instancias de EC2
variable "ec2_connect_ips" {
  description = "IP range for EC2 Instance Connect service"
  type        = string
}

# Variable para el CIDR block que permite todo el tráfico
variable "all_traffic_cidr" {
  description = "CIDR block to allow all traffic"
  type        = string
}

variable "name" {
  description = "Name of the Security Group"
  type        = string
}
