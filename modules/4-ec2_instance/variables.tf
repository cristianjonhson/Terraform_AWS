# Variable para el ID de la AMI (Amazon Machine Image) de la instancia EC2
variable "ami_id" {
  description = "ID de la AMI para la instancia EC2" # Descripción de la variable
  type        = string
}

# Variable para el tipo de instancia EC2
variable "instance_type" {
  description = "Tipo de instancia EC2" # Descripción de la variable
  type        = string
}

variable "subnet_id" {
  description = "ID de la subred"
  type        = string
}

variable "security_group_id" {
  description = "ID del Security Group"
  type        = string
}

variable "metadata_http_tokens_required" {
  description = "Requerir tokens IMDSv2"
  type        = bool
}

variable "root_volume_encrypted" {
  description = "Habilitar cifrado del volumen raíz EBS"
  type        = bool
}

variable "root_volume_size" {
  description = "Tamaño del volumen raíz EBS en GiB"
  type        = number
}

variable "root_volume_type" {
  description = "Tipo de volumen raíz EBS"
  type        = string
}

variable "name" {
  description = "Nombre para la instancia EC2"
  type        = string
}
