terraform {
  backend "s3" {
    bucket = "vin-s3-bucket-833"
    key    = "vinod/terraform.tfstate"
    region = "us-east-1"
    #dynamodb_table = "terraform-lock"
  }
}
