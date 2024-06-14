output "www_record_fqdn" {
  description = "The FQDN of the www Route 53 record"
  value       = aws_route53_record.www.fqdn
}

output "root_record_fqdn" {
  description = "The FQDN of the root Route 53 record"
  value       = aws_route53_record.root.fqdn
}
