resource "fly_app" "app" {
  name = replace("${var.name}-${var.domain}", ".", "-")
  org  = var.org
}

resource "fly_ip" "ipv4" {
  app        = fly_app.app.name
  type       = "v4"
  depends_on = [fly_app.app]
}

resource "fly_ip" "ipv6" {
  app        = fly_app.app.name
  type       = "v6"
  depends_on = [fly_app.app]
}

resource "fly_machine" "machine" {
  for_each = var.regions
  app      = fly_app.app.name
  region   = each.value
  name     = "${fly_app.app.name}-${each.value}"
  image    = var.image
  services = var.public ? [
    {
      ports = [
        {
          port     = 443
          handlers = ["tls", "http"]
        },
        {
          port     = 80
          handlers = ["http"]
        }
      ]
      "protocol" : "tcp",
      "internal_port" : var.internal_port
    },
  ] : []
  cpus       = var.cpus
  memorymb   = var.memorymb
  depends_on = [fly_app.app]
  env        = var.env
}

resource "fly_cert" "cert" {
  app        = fly_app.app.name
  hostname   = join(".", [var.name, var.domain])
  depends_on = [fly_app.app]
}
