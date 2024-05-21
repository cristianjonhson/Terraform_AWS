# Variable para el ID de la AMI (Amazon Machine Image) de la instancia EC2
variable "ami_id" {
  description = "AMI ID for the EC2 instance"       # Descripción de la variable
  type        = string
}

# Variable para el tipo de instancia EC2
variable "instance_type" {
  description = "EC2 instance type"                 # Descripción de la variable
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet"
  type        = string
}

variable "security_group_id" {
  description = "ID of the security group"
  type        = string
}

variable "name" {
  description = "Name for the EC2 instance"
  type        = string
}