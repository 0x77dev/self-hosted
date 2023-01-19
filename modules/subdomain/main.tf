resource "cloudflare_record" "ipv4" {
  zone_id = var.zone_id
  name    = var.name
  type    = "A"
  value   = var.ipv4
  ttl     = 1
  proxied = var.proxy
}

resource "cloudflare_record" "ipv6" {
  zone_id = var.zone_id
  name    = var.name
  type    = "AAAA"
  value   = var.ipv6
  ttl     = 1
  proxied = var.proxy
}

resource "cloudflare_record" "hello_ssl" {
  zone_id = var.zone_id
  name    = var.dnsvalidationhostname
  type    = "CNAME"
  value   = var.dnsvalidationtarget
  ttl     = 1
}
