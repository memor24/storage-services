terraform {
  required_version = ">= 0.13"
  required_providers {
    digitalocean{
    source="digitalocean/digitalocean" 
    version= "~>2.0"
    }

  }
}

provider "digitalocean" {               # or export credentials beforehand
    Token = var.digitalocean_token      # export DIGITALOCEAN_TOKEN="your-token"
    spaces_access_id = var.accesss_id
    spaces_secret_key = var.secret_key
}

