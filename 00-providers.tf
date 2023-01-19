terraform {
  required_providers {
    # CLOUDFLARE_API_TOKEN must be set in the environment
    # More info: https://developers.cloudflare.com/terraform
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
  }
}
