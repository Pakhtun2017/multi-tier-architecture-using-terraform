# Web Tier Load Balancer
resource "aws_lb" "web_lb" {
  name               = var.web_lb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.web_lb_security_group_id]
  subnets            = var.web_lb_subnet_ids
  tags = {
    Name = var.web_lb_name
  }
}

# App Tier Load Balancer
resource "aws_lb" "app_lb" {
  name               = var.app_lb_name
  internal           = true
  load_balancer_type = "application"
  security_groups    = [var.app_lb_security_group_id]
  subnets            = var.app_lb_subnet_ids
  tags = {
    Name = var.app_lb_name
  }
}

# Web Tier Target Group
resource "aws_lb_target_group" "web_tg" {
  name     = var.web_tg_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  health_check {
    path                = "/"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
  tags = {
    Name = var.web_tg_name
  }
}

# App Tier Target Group
resource "aws_lb_target_group" "app_tg" {
  name     = var.app_tg_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  health_check {
    path                = "/"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
  tags = {
    Name = var.app_tg_name
  }
}

# HTTP Listener for Web LB (Redirect HTTP to HTTPS)
resource "aws_lb_listener" "web_http" {
  load_balancer_arn = aws_lb.web_lb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type = "redirect"
    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

# HTTPS Listener for Web LB
resource "aws_lb_listener" "web_https" {
  load_balancer_arn = aws_lb.web_lb.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.certificate_arn
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_tg.arn
  }
}

# HTTP Listener for App LB
resource "aws_lb_listener" "app_http" {
  load_balancer_arn = aws_lb.app_lb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_tg.arn
  }
}
