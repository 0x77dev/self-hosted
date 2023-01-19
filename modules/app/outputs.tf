output "ipv4" {
  value = fly_ip.ipv4.address
}

output "ipv6" {
  value = fly_ip.ipv6.address
}

output "name" {
  value = fly_app.app.name
}

output "org" {
  value = fly_app.app.org
}

output "domain" {
  value = fly_cert.cert.hostname
}

output "dnsvalidationhostname" {
  value = fly_cert.cert.dnsvalidationhostname
}

output "dnsvalidationtarget" {
  value = fly_cert.cert.dnsvalidationtarget
}
