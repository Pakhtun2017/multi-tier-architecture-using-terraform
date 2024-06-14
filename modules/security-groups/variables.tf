variable "vpc_id" {
  description = "The VPC ID."
}

variable "alb_sg_web_name" {
  description = "Name for the WEB ALB security group."
}

variable "alb_sg_app_name" {
  description = "Name for the APP ALB security group."
}

variable "asg_sg_web_name" {
  description = "Name for the WEB ASG security group."
}

variable "asg_sg_app_name" {
  description = "Name for the APP ASG security group."
}

variable "db_sg_name" {
  description = "Name for the DB security group."
}
