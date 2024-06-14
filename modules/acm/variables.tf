variable "domain_name" {
  description = "The domain name for the certificate"
  type        = string
}

variable "zone_id" {
  description = "The ID of the Route 53 hosted zone"
  type        = string
}

variable "certificate_name" {
  description = "The name of the ACM certificate"
  type        = string
}
