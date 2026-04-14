# Variable para el CIDR block de la VPC
variable "vpc_cidr" {
  description = "Bloque CIDR de la VPC" # Descripción de la variable
}

variable "name" {
  description = "Nombre para la VPC"
  type        = string
}
