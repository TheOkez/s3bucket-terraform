provider "aws"{
    region = "eu-west-3"
   

}
resource "aws_s3_bucket" "okez-bucket1" {
  bucket = "okez-bucket1"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.okez-bucket1.id
  acl    = "public-read"
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.okez-bucket1.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_logging" "example" {
  bucket = aws_s3_bucket.okez-bucket1.id

  target_bucket = aws_s3_bucket.okez-bucket1.id
  target_prefix = "log/"
}