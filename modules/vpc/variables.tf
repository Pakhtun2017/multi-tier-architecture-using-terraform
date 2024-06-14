variable "cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
}

variable "name" {
  description = "The name of the VPC."
  type        = string
}

variable "tags" {
  description = "A map of tags to add to the VPC."
  type        = map(string)
  default     = {}
}
