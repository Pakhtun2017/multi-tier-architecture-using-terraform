
# Outputs
output "web_lb_dns_name" {
  value = aws_lb.web_lb.dns_name
}

output "app_lb_dns_name" {
  value = aws_lb.app_lb.dns_name
}

output "web_tg_arn" {
  value = aws_lb_target_group.web_tg.arn
}

output "app_tg_arn" {
  value = aws_lb_target_group.app_tg.arn
}

output "web_lb_zone_id" {
  value = aws_lb.web_lb.zone_id
}