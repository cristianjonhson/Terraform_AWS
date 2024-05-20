variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

# Variable para el CIDR block de la subred pública
variable "subnet_cidr" {
  description = "CIDR block for the public subnet"  # Descripción de la variable
}

# Variable para la zona de disponibilidad de la subred
variable "availability_zone" {
  description = "Availability zone for the subnet"  # Descripción de la variable
}

variable "name" {
  description = "Name for the subnet"
  type        = string
}