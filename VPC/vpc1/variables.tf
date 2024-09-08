variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-west-2"
}

variable "vpc_id" {
  description = "VPC ID to use if not creating VPC."
  default     = "123456789"
  type        = string
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  description = "CIDR block for the Subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "AWS Availability Zone"
  type        = string
  default     = "us-west-2a"
}

variable "instance_ami" {
  description = "The AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0c55b159cbfafe1f0" # sample ami for aws linux free tier
}

variable "instance_type" {
  description = "The type of EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "The key pair name to access the instance"
  type        = string
  default     = "key-pair-1"
}
