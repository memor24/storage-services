output "aws_s3_bucket_name" {
  description = "the name of the bucket"
  value       = aws_s3_bucket.example.id
}

output "aws_s3_bucket_version" {
description = "printing the example bucket's id/version"
  value = aws_s3_bucket.example.id
}