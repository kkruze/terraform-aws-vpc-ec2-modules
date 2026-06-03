# Terraform AWS VPC + EC2 Module Lab

## Overview

This project uses Terraform to provision a basic AWS environment with reusable modules.

It creates a custom VPC, public subnet, internet gateway, route table, security group, and EC2 instance.

The same modules are reused across separate dev, staging, and prod environments.

Terraform state is stored remotely in Amazon S3 with bucket versioning and S3-native state locking enabled.

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

* Terraform
* AWS VPC
* Amazon EC2
* Amazon S3
* AWS Security Groups
* Git
* GitHub

## Project Structure

```text
terraform-aws-vpc-ec2-modules/
├── backend-setup/
│   └── main.tf
├── modules/
│   ├── vpc/
│   └── ec2/
└── environments/
    ├── dev/
    │   └── backend.tf
    ├── staging/
    │   └── backend.tf
    └── prod/
        └── backend.tf
```

## What This Project Creates

### Backend Setup

* S3 bucket for remote Terraform state
* S3 bucket versioning for state recovery

### VPC Module

* VPC
* Public subnet
* Internet gateway
* Route table
* Route table association

### EC2 Module

* EC2 instance
* Security group
* SSH ingress rule
* Outbound traffic rule

## How the Modules Connect

The VPC module outputs the VPC ID and public subnet ID.

Each environment passes those outputs into the EC2 module so the EC2 instance launches inside the correct public subnet.

## Remote State and Locking

This project uses an S3 backend to store Terraform state remotely instead of relying only on local state files.

Each environment uses a separate state key:

* `dev/terraform.tfstate`
* `staging/terraform.tfstate`
* `prod/terraform.tfstate`

S3 bucket versioning is enabled to support state recovery.

S3-native state locking is enabled using:

```hcl
use_lockfile = true
```

This helps prevent conflicting Terraform operations from modifying the same state file at the same time.

## How to Run

Create the S3 backend bucket first:

```bash
cd backend-setup
terraform init
terraform plan
terraform apply
```

Then deploy an environment:

```bash
cd ../environments/dev
terraform init -migrate-state
terraform validate
terraform plan
terraform apply
```

To remove the infrastructure:

```bash
terraform destroy
```

## What I Learned

* How to build reusable Terraform modules
* How to separate dev, staging, and prod environments
* How variables and outputs work
* How one Terraform module passes values into another
* How an EC2 instance launches inside a custom VPC
* How security groups control access to EC2
* How to store Terraform state remotely in Amazon S3
* How separate state keys keep environment state isolated
* How S3 versioning supports state recovery
* How state locking helps prevent conflicting Terraform operations

## Next Improvements

* Restrict SSH access to my own public IP
* Add Docker to run a web container on EC2
* Add GitHub Actions for Terraform validation
