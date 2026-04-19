variable "vpc_id" {
  description = "ID de la VPC"
  type        = string
}

# Variable para el CIDR block de la subred pública
variable "subnet_cidr" {
  description = "Bloque CIDR de la subred pública" # Descripción de la variable
}

# Variable para la zona de disponibilidad de la subred
variable "availability_zone" {
  description = "Zona de disponibilidad para la subred" # Descripción de la variable
}

variable "name" {
  description = "Nombre para la subred"
  type        = string
}
