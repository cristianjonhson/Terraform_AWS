variable "ssh_port" {
  description = "Port for SSH"
  type        = number
  default     = 22
}

variable "http_port" {
  description = "Port for HTTP"
  type        = number
  default     = 80
}

variable "https_port" {
  description = "Port for HTTPS"
  type        = number
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