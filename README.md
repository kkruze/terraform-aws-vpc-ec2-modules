# Terraform AWS VPC + EC2 Module Lab (test in different environments)

## Overview

This project uses Terraform to provision a basic AWS environment with reusable modules.

It creates a custom VPC, public subnet, internet gateway, route table, security group, and EC2 instance.

The same modules are reused across separate dev, staging, and prod environments.

## Architecture

Internet  
↓  
Internet Gateway  
↓  
Public Route Table  
↓  
Public Subnet  
↓  
EC2 Instance  

## Tools Used

- Terraform
- AWS VPC
- Amazon EC2
- AWS Security Groups
- Git
- GitHub

## Project Structure

```text
terraform-aws-vpc-ec2-lab/
├── modules/
│   ├── vpc/
│   └── ec2/
└── environments/
    ├── dev/
    ├── staging/
    └── prod/

 ```

## What This Project Creates

### VPC Module
- VPC
- Public subnet
- Internet gateway
- Route table
- Route table association

### EC2 Module
- EC2 instance
- Security group
- SSH ingress rule
- Outbound traffic rule

## How the Modules Connect

The VPC module outputs the VPC ID and public subnet ID.

Each environment passes those outputs into the EC2 module so the EC2 instance launches inside the correct public subnet.

## How to Run

```bash
cd environments/dev
terraform init
terraform validate
terraform plan
terraform apply
```

To remove the infrastructure:

```bash
terraform destroy
```

## What I Learned

- How to build reusable Terraform modules
- How to separate dev, staging, and prod environments
- How variables and outputs work
- How one Terraform module passes values into another
- How an EC2 instance launches inside a custom VPC
- How security groups control access to EC2

## Next Improvements

- Restrict SSH access to my own public IP
- Add Docker to run a web container on EC2
- Add an S3 backend for remote Terraform state
- Add GitHub Actions for Terraform validation