provider "aws" {
  region = "us-east-1"
}

# ssh key pair for accessing the instances
resource "aws_key_pair" "minio_key" {
  key_name   = "minio-key"
  public_key = file("~/.ssh/id_rsa.pub") 
}

# security group for minio nodes
resource "aws_security_group" "minio_sg" {
  name        = "minio-sg"

  ingress {
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# ec2 instances for minio nodes
resource "aws_instance" "minio_node" {
  count         = 4          # MinIO requires at least 4 nodes for distributed mode
  ami           = "ami-0c02fb55956c7d316" # Ubuntu 18.04
  instance_type = "t2.micro" # t2.medium in practice
  key_name      = aws_key_pair.minio_key.key_name
  security_groups = [aws_security_group.minio_sg.name]

  tags = {
    Name = "minio-node-${count.index + 1}"
  }

  # volumes for storage
  root_block_device {
    volume_size = 20 # Gb
  }

  # install minio using remote-exec provisioner
  provisioner "remote-exec" {
    inline = [
      "curl -O https://dl.min.io/server/minio/release/linux-amd64/minio",
      "chmod +x minio",
      "sudo mv minio /usr/local/bin/",
      "sudo mkdir -p /data{1..4}", # creates directories for minio storage
      "sudo chmod -R 777 /data*",
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"              # default username
      private_key = file("~/.ssh/id_rsa") # private key for ssh
      host        = self.public_ip
    }
  }
}

# output minio nodes ip addresses
output "minio_node_ips" {
  value = aws_instance.minio_node[*].public_ip
}


#### configuration of minio nodes:

resource "null_resource" "configure_minio" {
  depends_on = [aws_instance.minio_node]

  provisioner "remote-exec" {
    inline = [
      "nohup minio server http://${aws_instance.minio_node[0].private_ip}/data{1..4} http://${aws_instance.minio_node[1].private_ip}/data{1..4} http://${aws_instance.minio_node[2].private_ip}/data{1..4} http://${aws_instance.minio_node[3].private_ip}/data{1..4} > /dev/null 2>&1 &",
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("~/.ssh/id_rsa")
      host        = aws_instance.minio_node[0].public_ip
    }
  }
}