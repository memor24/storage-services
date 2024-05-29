## Infrastructure as Code
In this repo, I will be adding infrastructure as code templates using Terraform for each of the AWS main services like IAM, VPC, Lambda, etc.
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
#### Configuration Management
Further configurations (e.g. for security) can be added using Ansible.
