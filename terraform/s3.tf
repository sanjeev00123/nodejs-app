# s3/main.tf
resource "aws_s3_bucket" "bucket" {
  bucket = "bucketfornodejsapplast"

  tags = {
    Name = "bucketfornodejsapplast"
  }
}

output "s3_bucket_id" {
  value = aws_s3_bucket.bucket.id
}

