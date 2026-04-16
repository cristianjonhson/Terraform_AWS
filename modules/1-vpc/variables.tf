# Variable para el CIDR block de la VPC
variable "vpc_cidr" {
  description = "CIDR block for the VPC" # Descripción de la variable
}

variable "name" {
  description = "Name for the VPC"
  type        = string
}