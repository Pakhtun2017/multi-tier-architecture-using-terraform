variable "vpc_id" {
  description = "The ID of the VPC."
  type        = string
}

variable "web_cidr_blocks" {
  description = "A list of CIDR blocks for the web subnets."
  type        = list(string)
}

variable "app_cidr_blocks" {
  description = "A list of CIDR blocks for the app subnets."
  type        = list(string)
}

variable "db_cidr_blocks" {
  description = "A list of CIDR blocks for the db subnets."
  type        = list(string)
}

variable "web_subnet_names" {
  description = "A list of names for the web subnets."
  type        = list(string)
}

variable "app_subnet_names" {
  description = "A list of names for the app subnets."
  type        = list(string)
}

variable "db_subnet_names" {
  description = "A list of names for the db subnets."
  type        = list(string)
}

variable "azs" {
  description = "A list of availability zones."
  type        = list(string)
}

variable "tags" {
  description = "A map of tags to add to the VPC."
  type        = map(string)
  default     = {}
}
