terraform {
  backend "s3" {
    bucket         = "first-tfstate-backened"
    key            = "terraform/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "first-tf-lock-table"
 }
}