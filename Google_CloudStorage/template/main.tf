provider google {
  credentials = file(var.credentials_file)
  project     = var.project_id
  region      = "us-west1"
}

### iam 
resource google_project_iam_member "new-member" {
  project = var.project_id
  role    = "roles/storage.admin"
  member  = "user:${var.user_email}"
}

### storage
resource google_storage_bucket "new-bucket" {
  name          = "mydomainname.com"      # must be unique
  location      = "US"
  storage_class = "STANDARD"
  force_destroy = true

  versioning {
    enabled = true
  }

  lifecycle_rule {
    condition {
      age = 30       # days
      action {
        type = "Delete"
      }
    }
  }
    label {
      env = "staging"
    }
   
  }

  # creating folder in the bucket
resource google_storage_bucket_storage "new-folder" {
  name = "parent-folder/"
  content= ""
  bucket = google_storage_bucket.new-bucket.name
}

### output
output "bucket_name" {
  value = google_storage_bucket.new-bucket.name
}

output "bucket_url" {
  value = "https://storage.googleapis.com/${google_storage_bucket.new-bucket.name}"
}