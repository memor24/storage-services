terraform {
  required_version = ">= 0.12"
  required_providers {
    digitalocean{
    source="digitalocean/digitalocean" 
    version= "~>2.0"
    }

  }
}

provider "digitalocean" {
    Token = var.digitalocean_token
    # or export credentials beforehand
    spaces_access_id = var.accesss_id
    spaces_secret_key = var.secret_key
}
}
