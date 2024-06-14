variable "region_name" {
  description = "The AWS region."
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC."
}

variable "vpc_name" {
  description = "Name for the VPC."
}

variable "web_subnet1_cidr" {
  description = "CIDR block for Web Subnet 1."
}

variable "web_subnet1_name" {
  description = "Name for Web Subnet 1."
}

variable "web_subnet2_cidr" {
  description = "CIDR block for Web Subnet 2."
}

variable "web_subnet2_name" {
  description = "Name for Web Subnet 2."
}

variable "app_subnet1_cidr" {
  description = "CIDR block for App Subnet 1."
}

variable "app_subnet1_name" {
  description = "Name for App Subnet 1."
}

variable "app_subnet2_cidr" {
  description = "CIDR block for App Subnet 2."
}

variable "app_subnet2_name" {
  description = "Name for App Subnet 2."
}

variable "db_subnet1_cidr" {
  description = "CIDR block for DB Subnet 1."
}

variable "db_subnet1_name" {
  description = "Name for DB Subnet 1."
}

variable "db_subnet2_cidr" {
  description = "CIDR block for DB Subnet 2."
}

variable "db_subnet2_name" {
  description = "Name for DB Subnet 2."
}

variable "az_1" {
  description = "Availability Zone 1."
}

variable "az_2" {
  description = "Availability Zone 2."
}

variable "igw_name" {
  description = "Name for the Internet Gateway."
}

variable "nat_gw_name" {
  description = "Name for the NAT Gateway."
}

variable "public_rt_name" {
  description = "Name for the public route table."
}

variable "private_rt_name" {
  description = "Name for the private route table."
}

variable "alb_web_name" {
  description = "Name for the Web Load Balancer."
}

variable "tg_web_name" {
  description = "Name for the Web Target Group."
}

variable "alb_app_name" {
  description = "Name for the App Load Balancer."
}

variable "tg_app_name" {
  description = "Name for the App Target Group."
}

variable "alb_sg_web_name" {
  description = "Name for the Web ALB Security Group."
}

variable "asg_sg_web_name" {
  description = "Name for the Web ASG Security Group."
}

variable "db_sg_name" {
  description = "Name for the DB Security Group."
}

variable "user_data" {
  description = "User data script for the instances."
  type        = string
}

variable "app_user_data" {
  description = "User data script for the APP instances."
  type        = string
}

variable "db_secret_id" {
  description = "The ID of the Secrets Manager secret."
}

variable "allocated_storage" {
  description = "The allocated storage for the DB instance."
  type        = number
}

variable "db_name" {
  description = "The name of the database."
}

variable "engine" {
  description = "The database engine."
}

variable "engine_version" {
  description = "The version of the database engine."
}

variable "instance_class" {
  description = "The instance class of the database."
}

variable "parameter_group_name" {
  description = "The parameter group name for the database."
}

variable "multi_az" {
  description = "Whether to create a Multi-AZ RDS instance."
  type        = bool
}

variable "db_subnet_group_name" {
  description = "The name of the DB subnet group."
}

variable "image_id" {
  description = "AMI ID for the instances."
}

variable "instance_type" {
  description = "Instance type for the instances."
}

variable "key_name" {
  description = "Key name for the instances."
}

variable "web_instance_name" {
  description = "Name for the Web instances."
}

variable "asg_web_name" {
  description = "Name for the Web Auto Scaling Group."
}

variable "app_instance_name" {
  description = "Name for the App instances."
}

variable "asg_app_name" {
  description = "Name for the App Auto Scaling Group."
}

variable "alb_sg_app_name" {
  description = "Name for the App ALB Security Group."
}

variable "asg_sg_app_name" {
  description = "Name for the App ASG Security Group."
}

variable "role_arn" {
  description = "The ARN of the role for Secrets Manager access."
}

variable "zone_id" {
  description = "Hosted Zone's Zone ID"
}

variable "domain_name" {
  description = "Domain name"
}

variable "certificate_name" {
  description = "Certificate name"
}

