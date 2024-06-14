variable "vpc_id" {
  description = "The VPC ID."
}

variable "internet_gateway_id" {
  description = "The Internet Gateway ID."
}

variable "nat_gateway_id" {
  description = "The NAT Gateway ID."
}

variable "public_route_table_name" {
  description = "The name of the public route table."
}

variable "private_route_table_name" {
  description = "The name of the private route table."
}

variable "public_subnet1_id" {
  description = "The ID of the first public subnet."
}

variable "public_subnet2_id" {
  description = "The ID of the second public subnet."
}

variable "private_subnet1_id" {
  description = "The ID of the first private subnet."
}

variable "private_subnet2_id" {
  description = "The ID of the second private subnet."
}
