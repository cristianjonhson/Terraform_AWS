# Variable para el ID de la AMI (Amazon Machine Image) de la instancia EC2
variable "ami_id" {
  description = "AMI ID for the EC2 instance" # Descripción de la variable
  type        = string
}

# Variable para el tipo de instancia EC2
variable "instance_type" {
  description = "EC2 instance type" # Descripción de la variable
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
  description = "Name for the EC2 instance"
  type        = string
}
