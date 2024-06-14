provider "aws" {
  alias  = "rds"
  region = var.region

  assume_role {
    role_arn = var.role_arn
  }
}

data "aws_secretsmanager_secret_version" "creds" {
  secret_id = var.secret_id
}

locals {
  db_creds = jsondecode(data.aws_secretsmanager_secret_version.creds.secret_string)
}

resource "aws_db_subnet_group" "this" {
  name       = var.db_subnet_group_name
  subnet_ids = var.subnet_ids

  tags = {
    Name = var.db_subnet_group_name
  }
}

resource "aws_db_instance" "this" {
  allocated_storage      = var.allocated_storage
  db_name                = var.db_name
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  username               = local.db_creds.username
  password               = local.db_creds.password
  parameter_group_name   = var.parameter_group_name
  multi_az               = var.multi_az
  db_subnet_group_name   = aws_db_subnet_group.this.name
  vpc_security_group_ids = var.security_group_ids
  skip_final_snapshot    = true

  tags = {
    Name = var.db_name
  }
}
