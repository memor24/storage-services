resource "aws_vpc" "vpc1" {
  cidr_block = var.vpc_cidr_block
}

#defining internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc1.id

  tags = {
    Name = "vpc1-igw"
  }
}
#defining subnet
resource "aws_subnet" "subnet1" {
  vpc_id            = aws_vpc.vpc1.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = var.availability_zone
}


# defining security group for the ec2 within the subnet
resource "aws_security_group" "security_group1" {
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
  ami             = "ami-0c55b159cbfafe1f0" // sample ami for aws linux free tier
  instance_type   = var.instance_type
  subnet_id       = aws_subnet.subnet1.id
  security_groups = [aws_security_group.security_group1.id]
  key_name        = var.key_name

  tags = {
    Name = "ec2instance1"
  }
}
