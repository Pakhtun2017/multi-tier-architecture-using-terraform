variable "name" {
  description = "Name of Autoscaling group"
}

variable "image_id" {
  description = "Image ID"
}

variable "instance_type" {
  description = "Instance type"
}

variable "key_name" {
  description = "key name"
}

variable "security_group_id" {
  description = "Security group ID"
}

variable "user_data" {
  description = "User data"
}

variable "instance_name" {
  description = "Instance name"
}

variable "desired_capacity" {
  description = "desired capacity"
}

variable "max_size" {
  description = "max size"
  type        = number
}

variable "min_size" {
  description = "max size"
  type        = number
}

variable "target_group_arns" {
  description = "Target group ARNS"
  type        = list(string)
}

variable "subnet_ids" {
  description = "List of subnet IDs"
  type        = list(string)
}
