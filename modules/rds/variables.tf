variable "region" {
  description = "The AWS region."
}

variable "role_arn" {
  description = "The IAM role ARN to assume."
}

variable "secret_id" {
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

variable "subnet_ids" {
  description = "List of subnet IDs for the DB subnet group."
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of security group IDs to associate with the DB instance."
  type        = list(string)
}
