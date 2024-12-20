variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-west-2"
}

variable "bucket_name" {
  description = "The name of the bucket"
  default     = "my-bucket"
  type        = string
}