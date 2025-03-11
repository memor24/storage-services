provider "aws" {
  region = "us-west-2"  
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  s3_force_path_style         = true

  endpoints {
    s3 = "http://localhost:9000" 
  }
}

resource "aws_s3_bucket" "minio_bucket" {
  bucket = "new-minio-bucket"
  acl    = "private"
}

resource "aws_s3_bucket_object" "minio_object" {
  bucket = aws_s3_bucket.minio_bucket.bucket
  key    = "sth.txt"
  source = "sth.txt"
  etag   = filemd5("sth.txt")
}

output "bucket_name" {
  value = aws_s3_bucket.minio_bucket.bucket
}

output "object_key" {
  value = aws_s3_bucket_object.minio_object.key
}

# verify after terraform apply
# aws s3 ls --endpoint-url http://localhost:9000 --no-verify-ssl s3://new-minio-bucket