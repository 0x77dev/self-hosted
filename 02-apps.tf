data "cloudflare_zone" "domain" {
  zone_id = var.zone_id
}

module "app_hello" {
  source        = "./modules/app"
  name          = "hello"
  image         = "nginx"
  public        = true
  internal_port = 80
  org           = var.org
  domain        = data.cloudflare_zone.domain.name
}

module "subdomain_hello" {
  source                = "./modules/subdomain"
  zone_id               = var.zone_id
  name                  = "hello"
  ipv4                  = module.app_hello.ipv4
  ipv6                  = module.app_hello.ipv6
  dnsvalidationhostname = module.app_hello.dnsvalidationhostname
  dnsvalidationtarget   = module.app_hello.dnsvalidationtarget
}
