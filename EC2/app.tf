#app.tf

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

resource "aws_instance" "instance1" {
  ami             = "ami-0c55b159cbfafe1f0" // sample ami for aws linux free tier
  instance_type   = t2.micro
  count       = 3
  key_name        = "key_pair_1"

  tags = {
    Name = "appserverec2"
  }


user_data = <<-EOF
            #!/bin/bash
            sudo service apache2 start
            EOF
}


# web server
# cluster of web servers

