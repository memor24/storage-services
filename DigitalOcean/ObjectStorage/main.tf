#
resource digitalocean_project "Storage_Project" {
    name = "Storage_Project"
    description= "digitalocean storage service"
    purpose= "storage resources from varied cloud providers"
    environment= "development"
    resources = [  resource.name.urn  ] 
}

# create a new tag for later use
resource digitalocean_tag "object_storage" {
    name="object_storage"
}

resource "" {

}


