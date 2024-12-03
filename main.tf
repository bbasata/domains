terraform {
  required_providers {
    dnsimple = {
      source  = "dnsimple/dnsimple"
      version = "~> 1.8.0"
    }
  }
}

provider "dnsimple" {
}

variable "domain_name" {
  description = "The domain name to manage in DNSimple"
  type        = string
}

variable "public_ipv4_address" {
  description = "The public IPv4 address to use in DNS records"
  type        = string
}

resource "dnsimple_domain" "example" {
  name = var.domain_name
}

resource "dnsimple_zone_record" "root" {
  zone_name = dnsimple_domain.example.name
  name      = ""
  value     = var.public_ipv4_address
  type      = "A"
  ttl       = 3600
}

resource "dnsimple_zone_record" "www" {
  zone_name = dnsimple_domain.example.name
  name      = "www"
  value     = var.public_ipv4_address
  type      = "A"
  ttl       = 3600
}
