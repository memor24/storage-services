output "vpc_id" {
  description = "id of VPC"
  value       = aws_vpc.vpc1.id
}

output "aws_igw_id" {
  value = aws_internet_gateway.igw.id
  description = "The id of the internet gateway"
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