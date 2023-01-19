terraform {
  required_providers {
    # FLY_API_TOKEN must be set in the environment
    # More info: https://fly.io/docs/machines/guides-examples/terraform-machines
    fly = {
      source  = "fly-apps/fly"
      version = "0.0.20"
    }
  }
}
