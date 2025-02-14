# define a project to bundle resources together 
# e.g. for each microservices
resource "digitalocean_project" "Storage_Project" {
  name        = "Storage_Project"
  description = "digitalocean storage service"
  purpose     = "storage resources from varied cloud providers"
  environment = "development"
  resources   = [digitalocean_volume.new_volume.urn]
}

# create a new tag for later use
resource "digitalocean_tag" "new_tag" {
  name = "block_storage"
}

resource "digitalocean_volume" "new_volume" {
  name                    = "new_volume"
  region                  = nyc1
  size                    = 100
  initial_filesystem_type = "ext4"
}

resource "digitalocean_droplet" "new_vm" {
  name   = "new_vm"
  region = nyc1
  size   = "s-1vcpu-1gb"
  image  = "ubuntu-22-04-x64"
  tags   = [digitalocean_tag.new_tag.id]
}

resource "digitalocean_volume_attachment" "new_vm" {
  volume_id  = digitalocean_volume.new_volume.id
  droplet_id = digitalocean_droplet.new_vm.id
}
