terraform {
  required_version = ">= 1.0"
  required_providers {
    digitalocean={
    source="digitalocean/digitalocean" 
    version= "~>2.0"
    }
  }
}

  provider "digitalocean" {
    Token = var.digitalocean_token ## export DIGITALOCEAN_TOKEN=""
  }