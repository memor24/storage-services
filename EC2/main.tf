### Provider ###
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
  region = "us-west-2"
}

### Resources ###
resource "aws_instance" "new_instance" {
  ami             = "ami-0c55b159cbfafe1f0" #sample ami for aws linux free tier
  instance_type   = "t2.micro"
  count       = 3
  key_name        = "key_pair_1"
public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 email@example.com"
  
  tags = {
    Name = "ec2instance1" 
  }
#example ec2 usage as app server
user_data = <<-EOF
            #!/bin/bash
            sudo service apache2 start
            EOF
}

resource "aws_ec2_host" "new_host" {
  instance_type     = "t2.micro"
  availability_zone = "us-west-2a"
  host_recovery = "on"
  auto_placement="on"
}

data "aws_ec2_host" "new_host" {
  host_id = aws_ec2_host.new_host.id
}
