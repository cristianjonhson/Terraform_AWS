# Variable para el CIDR block de la VPC
variable "vpc_cidr" {
  description = "El bloque CIDR de la VPC" # Descripción de la variable
  default     = "10.0.0.0/16"              # Valor por defecto para el CIDR block de la VPC
}

# Variable para el CIDR block de la subred pública
variable "subnet_cidr" {
  description = "El bloque CIDR de la subred publica" # Descripción de la variable
  default     = "10.0.1.0/24"                         # Valor por defecto para el CIDR block de la subred
}

# Variable para la zona de disponibilidad de la subred
variable "availability_zone" {
  description = "La zona de disponibilidad donde se creará la subred" # Descripción de la variable
  default     = "us-east-1a"                                          # Valor por defecto para la zona de disponibilidad
}

# Variable para el ID de la AMI (Amazon Machine Image) de la instancia EC2
variable "ami_id" {
  description = "El ID de la AMI para la instancia EC2" # Descripción de la variable
  default     = "ami-0c0b74d29acd0cd97"                 # Valor por defecto para el ID de la AMI
}

# Variable para el tipo de instancia EC2
variable "instance_type" {
  description = "El tipo de instancia EC2" # Descripción de la variable
  default     = "t2.micro"                 # Valor por defecto para el tipo de instancia

}

# Variable para el puerto SSH
variable "ssh_port" {
  description = "Puerto para acceso SSH"
  default     = 22

  validation {
    condition     = var.ssh_port >= 1 && var.ssh_port <= 65535
    error_message = "ssh_port debe estar entre 1 y 65535."
  }
}

# Variable para el puerto HTTP
variable "http_port" {
  description = "Puerto para acceso HTTP"
  default     = 80

  validation {
    condition     = var.http_port >= 1 && var.http_port <= 65535
    error_message = "http_port debe estar entre 1 y 65535."
  }
}

# Variable para el puerto HTTPS
variable "https_port" {
  description = "Puerto para acceso HTTPS"
  default     = 443

  validation {
    condition     = var.https_port >= 1 && var.https_port <= 65535
    error_message = "https_port debe estar entre 1 y 65535."
  }
}

# Variable para la dirección IP permitida para acceder por SSH a la instancia EC2
variable "ssh_ip" {
  description = "La dirección IP específica que permitirá el acceso SSH" # Descripción de la variable
  default     = "192.168.0.11/32"                                        # Valor por defecto para la dirección IP permitida

  validation {
    condition     = can(cidrhost(var.ssh_ip, 0)) && var.ssh_ip != "0.0.0.0/0"
    error_message = "ssh_ip debe ser un CIDR válido y no puede ser 0.0.0.0/0 por seguridad."
  }
}

# Variable para el rango de direcciones IP del servicio Conexión de instancias de EC2
variable "ec2_connect_ips" {
  description = "Las direcciones IP del servicio Conexión de instancias de EC2" # Descripción de la variable
  default     = "18.206.107.24/29"                                              # Valor por defecto para el rango de direcciones IP

  validation {
    condition     = can(cidrhost(var.ec2_connect_ips, 0))
    error_message = "ec2_connect_ips debe ser un CIDR válido."
  }
}

# Variable para el CIDR block que permite todo el tráfico
variable "all_traffic_cidr" {
  description = "El bloque CIDR que permite todo el tráfico" # Descripción de la variable
  default     = "0.0.0.0/0"                                  # Valor por defecto para permitir todo el tráfico

  validation {
    condition     = can(cidrhost(var.all_traffic_cidr, 0))
    error_message = "all_traffic_cidr debe ser un CIDR válido."
  }
}

# Variable para forzar el uso de IMDSv2 en la instancia EC2
variable "metadata_http_tokens_required" {
  description = "Forzar IMDSv2 en la instancia EC2"
  type        = bool
  default     = true
}

# Variable para cifrar el volumen raíz de la instancia EC2
variable "root_volume_encrypted" {
  description = "Habilitar cifrado del volumen raíz EBS"
  type        = bool
  default     = true
}

# Variable para el tamaño del volumen raíz de la instancia EC2
variable "root_volume_size" {
  description = "Tamaño del volumen raíz EBS en GiB"
  type        = number
  default     = 8

  validation {
    condition     = var.root_volume_size >= 8
    error_message = "root_volume_size debe ser mayor o igual a 8 GiB."
  }
}

# Variable para el tipo de volumen raíz de la instancia EC2
variable "root_volume_type" {
  description = "Tipo de volumen raíz EBS"
  type        = string
  default     = "gp3"

  validation {
    condition     = contains(["gp2", "gp3", "io1", "io2", "st1", "sc1", "standard"], var.root_volume_type)
    error_message = "root_volume_type debe ser un tipo de volumen EBS válido."
  }
}
