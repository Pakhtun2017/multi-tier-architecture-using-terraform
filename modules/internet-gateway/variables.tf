variable "vpc_id" {
  description = "VPC ID"
}

variable "name" {
  description = "Name of Internet Gateway"
}

variable "tags" {
  description = "A map of tags to add to the resource."
  type        = map(string)
  default     = {}
}