output "vpc_id" {
  description = "id of VPC"
  value       = aws_vpc.vpc1.id
}

output "subnet_id" {
  description = "id of subnet"
  value       = aws_subnet.subnet1.id
}

output "instance_id" {
  description = "id of ec2 instance"
  value       = aws_instance.instance1.id
}

output "instance_public_ip" {
  description = "The public IP of the ec2 instance"
  value       = aws_instance.instance1.public_ip
}


#data source for igw ID

data "aws_internet_gateway" "igw" {
  filter {
    name   = "attachment.vpc-id"
    values = [var.vpc_id]
  }
}