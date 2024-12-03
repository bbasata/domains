resource "dnsimple_lets_encrypt_certificate" "example" {
  domain_id = dnsimple_domain.example.id
  name = "examplebat.com"
  auto_renew = true
}
