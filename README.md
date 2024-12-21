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
#### Note
If you want to deploy them for experimentation without the cost directly billed to your AWS, you may use a sandbox AWS environment like [kodekloud AWS](https://kodekloud.com/playgrounds/playground-aws), \
or you may also use Local Stack that helps with deploying to a local AWS emulated environment. 
For that, install a docker container of localstack, then launch it in a seperate terminal before terraform plan/apply.
```
docker run -d localstack/localstack
#or
localstack start
```
In this case, you want to use tflocal command instead of terraform command to avoid credentials related complications:
```
tflocal apply
tflocal state list
```
Make sure to clean up the resources:
```
tflocal destroy

localstack stop
#or
docker rm [container_id]
```
