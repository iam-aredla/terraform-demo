provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "s3" {

  tags = {
    Name = "MyS3Bucket"
  }
}

import {
  to = aws_s3_bucket.s3
  id = var.s3_bucket_name
}

output "s3_bucket_id" {
  value = aws_s3_bucket.s3.id
}