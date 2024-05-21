variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "igw_id" {
  description = "ID of the Internet Gateway"
  type        = string
}

variable "all_traffic_cidr" {
  description = "CIDR block to allow all traffic"
  type        = string
}

variable "name" {
  description = "Name for the route table"
  type        = string
}
