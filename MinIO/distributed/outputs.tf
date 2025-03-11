output "minio_access_url" {
  value = "http://${aws_instance.minio_node[0].public_ip}:9000"
}

output "minio_access_key" {
  value = "minioadmin" # default access key
}

output "minio_secret_key" {
  value = "minioadmin" # default secret key
}
