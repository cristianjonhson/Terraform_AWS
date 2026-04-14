variable "vpc_id" {
  description = "ID de la VPC"
  type        = string
}

variable "ssh_port" {
  description = "Puerto para acceso SSH"
  type        = number
}

variable "http_port" {
  description = "Puerto para acceso HTTP"
  type        = number
}

variable "https_port" {
  description = "Puerto para acceso HTTPS"
  type        = number
}

# Variable para la dirección IP permitida para acceder por SSH a la instancia EC2
variable "ssh_ip" {
  description = "Dirección IP permitida para acceder por SSH a la instancia EC2"
  type        = string
}

# Variable para el rango de direcciones IP del servicio Conexión de instancias de EC2
variable "ec2_connect_ips" {
  description = "Rango de direcciones IP del servicio Conexión de instancias de EC2"
  type        = string
}

# Variable para el CIDR block que permite todo el tráfico
variable "all_traffic_cidr" {
  description = "Bloque CIDR para permitir todo el tráfico"
  type        = string
}

variable "name" {
  description = "Nombre del Security Group"
  type        = string
}
