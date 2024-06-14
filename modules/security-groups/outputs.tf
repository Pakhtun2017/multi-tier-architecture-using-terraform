output "alb_sg_web_id" {
  value = aws_security_group.alb_sg_web.id
}

output "asg_sg_web_id" {
  value = aws_security_group.asg_sg_web.id
}

output "alb_sg_app_id" {
  value = aws_security_group.alb_sg_app.id
}

output "asg_sg_app_id" {
  value = aws_security_group.asg_sg_app.id
}

output "db_sg_id" {
  value = aws_security_group.db_sg.id
}
