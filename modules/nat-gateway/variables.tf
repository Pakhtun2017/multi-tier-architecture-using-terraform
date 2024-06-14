variable "public_subnet_id" {
  description = "Public subnet id"
}

variable "internet_gateway_id" {
  description = "Internet Gateway id"
}

variable "name" {
  description = "Name of NAT Gateway"
}

variable "tags" {
  description = "A map of tags to add to the resource."
  type        = map(string)
  default     = {}
}
