variable "vpc_id" {
  description = "The VPC ID."
}

variable "web_lb_name" {
  description = "Name of Web ALB"
}

variable "web_lb_security_group_id" {
  description = "Web ALB Security Group ID"
}

variable "web_lb_subnet_ids" {
  description = "Web ALB Subnet IDs"
}

variable "app_lb_name" {
  description = "App ALB name"
}

variable "app_lb_security_group_id" {
  description = "App ALB Security Group Id"
}

variable "app_lb_subnet_ids" {
  description = "App ALB Subnet IDs"
}

variable "web_tg_name" {
  description = "Web Target Group name"
}

variable "app_tg_name" {
  description = "App Target Group name"
}

variable "certificate_arn" {
  description = "ARN of ACM certificate"
}