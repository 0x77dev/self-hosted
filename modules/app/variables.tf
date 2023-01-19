variable "domain" {
  default     = "example.com"
  description = "Base domain name"
}

variable "org" {
  default     = "personal"
  description = "Fly.io organization name"
}

variable "name" {
  description = "application name"
}

variable "public" {
  description = "expose HTTP/HTTPS"
  default     = false
}

variable "internal_port" {
  default     = 3000
  description = "default internal port"
}

variable "image" {
  description = "docker image"
}

variable "cpus" {
  default = 1
}

variable "memorymb" {
  default = 256
}

variable "regions" {
  type        = set(string)
  default     = ["ams"]
  description = "https://fly.io/docs/reference/regions"
}

variable "env" {
  type    = map(string)
  default = {}
}
