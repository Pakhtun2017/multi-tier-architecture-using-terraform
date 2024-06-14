variable "name" {
  description = "The name of the Auto Scaling Group."
  type        = string
}

variable "image_id" {
  description = "The AMI ID for the instances."
  type        = string
}

variable "instance_type" {
  description = "The instance type."
  type        = string
}

variable "key_name" {
  description = "The key name for the instances."
  type        = string
}

variable "security_group_id" {
  description = "The security group ID for the instances."
  type        = string
}

variable "instance_name" {
  description = "The name of the instances."
  type        = string
}

variable "desired_capacity" {
  description = "The desired capacity of the Auto Scaling Group."
  type        = number
}

variable "max_size" {
  description = "The maximum size of the Auto Scaling Group."
  type        = number
}

variable "min_size" {
  description = "The minimum size of the Auto Scaling Group."
  type        = number
}

variable "subnet_ids" {
  description = "The subnet IDs for the Auto Scaling Group."
  type        = list(string)
}

variable "target_group_arns" {
  description = "The target group ARNs for the Auto Scaling Group."
  type        = list(string)
}

variable "app_user_data" {
  description = "User data for App tier"
}
