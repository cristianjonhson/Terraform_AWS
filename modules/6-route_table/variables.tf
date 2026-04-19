variable "vpc_id" {
  description = "ID de la VPC"
  type        = string
}

variable "igw_id" {
  description = "ID del Internet Gateway"
  type        = string
}

variable "all_traffic_cidr" {
  description = "Bloque CIDR para permitir todo el tráfico"
  type        = string
}

variable "name" {
  description = "Nombre para la tabla de rutas"
  type        = string
}
