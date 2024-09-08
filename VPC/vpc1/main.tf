# terraform {
#   required_version = ">= 0.15.0"
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~> 5.0"
#     }
#   }
# }

# provider "aws" {
#   region = "us-west-2"
# }

resource "aws_vpc" "vpc1" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.vpc1.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-west-2a"
}

# defining security group for the ec2 within the subnet
resource "aws_security_group" "ecurity_group1" {
  name        = "security-group1"
  description = "security group for ec2 instance"
  vpc_id      = aws_vpc.vpc1.id

#opening port 22 and 80 only for inbound access
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

#allowing all traffic for outbound access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "instance1" {
  ami           = "ami-0c55b159cbfafe1f0"  // sample ami for aws linux free tier
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.subnet1.id
  security_groups = [aws_security_group.security_group1.id]
  key_name = "keypair1"

  tags = {
    Name = "ec2instance1"
  }
}
