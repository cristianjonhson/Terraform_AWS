# Variable para el CIDR block de la VPC
variable "vpc_cidr" {
  description = "CIDR block for the VPC"  # Descripción de la variable
  default     = "10.0.0.0/16"             # Valor por defecto para el CIDR block de la VPC
}


variable "name" {
  description = "Name for the VPC"
  type        = string
}