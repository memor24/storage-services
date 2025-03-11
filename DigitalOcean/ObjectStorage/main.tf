#
resource digitalocean_project "Storage_Project" {
    name = "Storage_Project"
    description= "digitalocean storage service"
    purpose= "storage resources from varied cloud providers"
    environment= "development"
    resources = [  resource.name.urn  ] 
}

# create a new tag for later use
resource digitalocean_tag "new_tag" {
    name="object_storage"
}


# object storage buckets are called spaces in digitalocean
resource digitalocean_spaces_bucket "new_bucket" {
    name = "new_bucket"
    region = "nyc1"
    acl = "private"
    tags = [digitalocean_tag.new_tag.id]
}

output space_bucket_endpoint {
    value = digitalocean_spaces_bucket.new_bucket.endpoint
}
