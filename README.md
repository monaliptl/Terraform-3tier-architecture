# Terraform 3-Tier Architecture


## 🧱 Project Purpose
-  The core goal was to create an Infrastructure-as-Code setup that can be easily extended or reused across multiple environments, such as:
-  🔄 Staging vs Production
-  🧪 Testing configurations with minimal changes
-  🚀 Rapid provisioning with different .tfvars without touching the core module logic
   This foundation can now be used to deploy isolated, scalable, and secure environments with very little duplication or rework.
   

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



## 📌 Project Highlights
-  ✅ Built a secure and modular AWS 3-tier architecture using Terraform, with public/private subnet segregation across two Availability Zones (AZs) for better fault tolerance.
-  ✅ Implemented a public-facing Application Load Balancer (ALB) deployed across multiple AZs to ensure high availability and load distribution.
-  ✅ Used Terraform modules and .tfvars to automate environment-specific variables like subnets and CIDRs.
-  ❗App EC2 and RDS are currently deployed in a single private subnet (i.e., single AZ) — designed this way intentionally to test and strengthen my Terraform skills while focusing on
     modular, reusable code.

## 🛠️ Tools & Technologies Used
- AWS: VPC, Subnets (Public/Private), EC2, ALB, RDS, Internet Gateway, NAT Gateway, S3, DynamoDB
- Terraform: Modules, remote backend configuration, input variables, .tfvars
- Infrastructure as Code (IaC): Fully automated deployment with environment-specific flexibility
- State Management: S3 for remote backend + DynamoDB for state locking

 ## Prerequisites

- AWS CLI configured with appropriate credentials and permissions
- Terraform installed 
- SSH key pair created in AWS for EC2 access
