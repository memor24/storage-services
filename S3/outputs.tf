output "aws_s3_bucket_name" {
  description = "the name of the bucket"
  value       = aws_s3_bucket.example.id
}

output "aws_s3_bucket_version" {
  
  value = aws_s3_bucket_version.versioning_example.id
}