variable "zone_id" {
  description = "The ID of the Route 53 hosted zone"
  type        = string
}

variable "domain_name" {
  description = "The domain name"
  type        = string
}

variable "lb_dns_name" {
  description = "The DNS name of the load balancer"
  type        = string
}

variable "lb_zone_id" {
  description = "The zone ID of the load balancer"
  type        = string
}
