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
  description = "ID del security group"
  type        = string
}

variable "metadata_http_tokens_required" {
  description = "Require IMDSv2 tokens"
  type        = bool
}

variable "root_volume_encrypted" {
  description = "Enable encryption for root EBS volume"
  type        = bool
}

variable "root_volume_size" {
  description = "Root EBS volume size in GiB"
  type        = number
}

variable "root_volume_type" {
  description = "Root EBS volume type"
  type        = string
}

variable "name" {
  description = "Nombre para la instancia EC2"
  type        = string
}
