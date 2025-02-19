terraform {
  #required_version = ">= 0.12"
  required_providers {
    digitalocean={
    source="digitalocean/digitalocean" 
    version= "~>2.0"
    }
  }
}

  provider "digitalocean" {
    Token = var.digitalocean_token
  }