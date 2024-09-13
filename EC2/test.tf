
#test.tf

terraform {
  required_version = ">= 0.15.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = ""us-west-2""
}

# test ec2 host
resource "aws_ec2_host" "test" {
  instance_type     = "t2.micro"
  availability_zone = "us-west-2a"
}

data "aws_ec2_host" "test" {
  host_id = aws_ec2_host.test.id
}

## instance status (stopped or running)

