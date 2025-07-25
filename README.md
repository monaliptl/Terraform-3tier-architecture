# Terraform three-Tier Architecture

This project demonstrates an enterprise-like multi-tier architecture on AWS using Terraform. It is modular, scalable, and follows best practices for infrastructure as code.

## Project Structure
<pre>
Terraform-3tier-architecture/  <br>
├── backened-setup/                   <br>
│   └── main.tf             # Backend setup (S3 + DynamoDB config)   <br>
│
└── three-tier-arch/                                                     <br>
    ├── main.tf             # Root configuration calling all modules <br>
    ├── variables.tf               <br>
    ├── outputs.tf          # Outputs from root module               <br>
    ├── terraform.tfvars    # Variable values                        <br>
    ├── modules/            # Infrastructure modules                 <br>
    │   ├── vpc/            # VPC, subnets, internet gateway, routing<br>
    │   ├── frontend/       # ALB + Web Tier EC2 + Security Groups    <br>
    │   ├── app/            # Private App Tier EC2 + Security Groups  <br>
    │   └── db/             # RDS instance + Security Groups          <br>
</pre>


## Features

- Modular Terraform code for each tier (VPC, frontend, app, db)
- Multi-AZ public and private subnets
- ALB with public web tier EC2 instances
- Private app tier EC2 instances with secure communication to frontend tier
- RDS MySQL instance in private subnet with restricted access
- Security groups enforcing least privilege between tiers
- Remote Terraform state stored in S3 with state locking via DynamoDB

## Prerequisites

- AWS CLI configured with appropriate credentials and permissions
- Terraform installed 
- SSH key pair created in AWS for EC2 access
