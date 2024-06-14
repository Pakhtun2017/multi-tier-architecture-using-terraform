provider "aws" {
  region = var.region_name
}

module "vpc" {
  source     = "./modules/vpc"
  cidr_block = var.vpc_cidr_block
  name       = var.vpc_name
}

module "subnets" {
  source           = "./modules/subnets"
  vpc_id           = module.vpc.vpc_id
  web_cidr_blocks  = [var.web_subnet1_cidr, var.web_subnet2_cidr]
  app_cidr_blocks  = [var.app_subnet1_cidr, var.app_subnet2_cidr]
  db_cidr_blocks   = [var.db_subnet1_cidr, var.db_subnet2_cidr]
  web_subnet_names = [var.web_subnet1_name, var.web_subnet2_name]
  app_subnet_names = [var.app_subnet1_name, var.app_subnet2_name]
  db_subnet_names  = [var.db_subnet1_name, var.db_subnet2_name]
  azs              = [var.az_1, var.az_2]
}

module "internet_gateway" {
  source = "./modules/internet-gateway"
  vpc_id = module.vpc.vpc_id
  name   = var.igw_name
}

module "nat_gateway" {
  source              = "./modules/nat-gateway"
  public_subnet_id    = element(module.subnets.web_subnet_ids, 0)
  internet_gateway_id = module.internet_gateway.internet_gateway_id
  name                = var.nat_gw_name
}

module "route_tables" {
  source                   = "./modules/route-tables"
  vpc_id                   = module.vpc.vpc_id
  internet_gateway_id      = module.internet_gateway.internet_gateway_id
  nat_gateway_id           = module.nat_gateway.nat_gateway_id
  public_route_table_name  = var.public_rt_name
  private_route_table_name = var.private_rt_name
  public_subnet1_id        = element(module.subnets.web_subnet_ids, 0)
  public_subnet2_id        = element(module.subnets.web_subnet_ids, 1)
  private_subnet1_id       = element(module.subnets.app_subnet_ids, 0)
  private_subnet2_id       = element(module.subnets.app_subnet_ids, 1)
}

module "security_groups" {
  source          = "./modules/security-groups"
  vpc_id          = module.vpc.vpc_id
  alb_sg_web_name = var.alb_sg_web_name
  alb_sg_app_name = var.alb_sg_app_name
  asg_sg_web_name = var.asg_sg_web_name
  asg_sg_app_name = var.asg_sg_app_name
  db_sg_name      = var.db_sg_name
}

module "acm" {
  source           = "./modules/acm"
  domain_name      = "tolstoynow.com"
  zone_id          = var.zone_id
  certificate_name = "tolstoynow-cert"
}

module "load_balancer" {
  source                   = "./modules/load-balancer"
  web_lb_name              = var.alb_web_name
  app_lb_name              = var.alb_app_name
  web_tg_name              = var.tg_web_name
  app_tg_name              = var.tg_app_name
  web_lb_security_group_id = module.security_groups.alb_sg_web_id
  app_lb_security_group_id = module.security_groups.alb_sg_app_id
  web_lb_subnet_ids        = module.subnets.web_subnet_ids
  app_lb_subnet_ids        = module.subnets.app_subnet_ids
  vpc_id                   = module.vpc.vpc_id
  certificate_arn          = module.acm.certificate_arn
}

module "autoscaling-web" {
  source            = "./modules/autoscaling-web"
  name              = var.asg_web_name
  image_id          = var.image_id
  instance_type     = var.instance_type
  key_name          = var.key_name
  security_group_id = module.security_groups.asg_sg_web_id
  user_data         = var.user_data
  instance_name     = var.web_instance_name
  desired_capacity  = 2
  max_size          = 4
  min_size          = 1
  target_group_arns = [module.load_balancer.web_tg_arn]
  subnet_ids        = module.subnets.web_subnet_ids
}

module "autoscaling_app" {
  source            = "./modules/autoscaling-app"
  name              = var.asg_app_name
  image_id          = var.image_id
  instance_type     = var.instance_type
  key_name          = var.key_name
  security_group_id = module.security_groups.asg_sg_app_id
  app_user_data     = var.app_user_data
  instance_name     = var.app_instance_name
  desired_capacity  = 2
  max_size          = 4
  min_size          = 1
  target_group_arns = [module.load_balancer.app_tg_arn]
  subnet_ids        = module.subnets.app_subnet_ids
}

module "rds" {
  source               = "./modules/rds"
  region               = var.region_name
  role_arn             = var.role_arn
  secret_id            = var.db_secret_id
  allocated_storage    = var.allocated_storage
  db_name              = var.db_name
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  parameter_group_name = var.parameter_group_name
  multi_az             = var.multi_az
  db_subnet_group_name = var.db_subnet_group_name
  security_group_ids   = [module.security_groups.db_sg_id]
  subnet_ids           = module.subnets.db_subnet_ids
}

module "route53" {
  source       = "./modules/route53"
  zone_id      = var.zone_id
  domain_name  = "tolstoynow.com"
  lb_dns_name  = module.load_balancer.web_lb_dns_name
  lb_zone_id   = module.load_balancer.web_lb_zone_id
}