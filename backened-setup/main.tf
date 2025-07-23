provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "tf_state" {
  bucket        = "first-tfstate-backened"
  force_destroy = true
}

resource "aws_dynamodb_table" "tf_lock" {
  name         = "first-tf-lock-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
