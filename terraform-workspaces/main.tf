provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "exalmple" {
  ami           = var.ami_value
  instance_type = lookup(var.instance_type_value, terraform.workspace, "t2.micro")
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "vin-s3-bucket-833"
}

/*resource "aws_dynamodb_table" "terraform_lock" {
  name           = "terraform-lock"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}*/