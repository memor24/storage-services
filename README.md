## Infrastructure as Code
In this repo, I will be adding infrastructure as code using Terraform for varied storage services:

- Digital Ocean: block storage and object storage
- GCP: cloud storage
- MinIO: s3 compaibility and distributed storage


Use Terraform to provision in your environment:
```
terraform init
```
To clean the code syntax, basic validation and detailed planning, use:
```
terraform fmt
terraform validate
terraform plan
```
To create the infrastructure as planned, use:
```
terraform apply
```
To delete and completely remove the infrastructure, use:
```
terraform destroy
```
