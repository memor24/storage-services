## Infrastructure as Code
In this repo, I will be adding infrastructure as code templates using Terraform for each of the AWS main services like IAM, S3, EC2, VPC, RDS, DynamoDB, Lambda.
```terraform
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
To delete (e.g. for cost control) and completely remove the infrastructure, use:
```
terraform destroy
```
