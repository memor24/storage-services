## Infrastructure as Code (IaC)
In this repo, I will be adding Terraform codes for each of the AWS main services like IAM, ec2, S3, VPC, Lambda.
```terraform
terraform init
// to clean the code syntax, use:
terraform fmt
terraform validate
// to create the infrastructure, use:
terraform plan
terraform apply
// to delete the infrastructure (e.g. for cost control), use:
terraform destroy
```
## Configuration Management
Further configurations (e.g. for security) will be added as Ansible files.
