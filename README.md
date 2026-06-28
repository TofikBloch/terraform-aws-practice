# Terraform AWS Infrastructure

Provisions AWS infrastructure using Terraform IaC.

## Resources
- S3 bucket with tagging
- EC2 t2.micro instance (Amazon Linux 2023)
- Security Group with SSH access

## Project Structure
.

├── main.tf                  # Resource definitions + data sources

├── variables.tf             # Variable declarations

├── terraform.tfvars.example # Example variable values

├── outputs.tf               # Output values

└── .terraform.lock.hcl      # Provider version lock

## Data Sources
AMI ID and Subnet ID are fetched dynamically at runtime — no hardcoded AWS-specific values.
- `aws_ami` — always resolves to the latest Amazon Linux 2023 x86_64 image
- `aws_subnet` — fetches the default subnet in ap-south-1a

## Prerequisites
- Terraform >= 1.0
- AWS CLI configured with valid credentials
- AWS account with EC2 and S3 permissions

## Usage

```bash
# Clone the repo
git clone https://github.com/TofikBloch/terraform-aws-practice.git
cd terraform-aws-practice

# Copy and fill in your values
cp terraform.tfvars.example terraform.tfvars

# Initialize and deploy
terraform init
terraform plan
terraform apply

# Tear down
terraform destroy
```

## Workspaces

```bash
# Create and switch to dev
terraform workspace new dev
terraform apply -var-file="dev.tfvars"

# Create and switch to prod
terraform workspace new prod
terraform apply -var-file="prod.tfvars"
```

## Outputs
| Name | Description |
|------|-------------|
| bucket_name | S3 bucket name |
| bucket_arn | S3 bucket ARN |
| ec2_instance_id | EC2 instance ID |
| ec2_public_ip | EC2 public IP address |
