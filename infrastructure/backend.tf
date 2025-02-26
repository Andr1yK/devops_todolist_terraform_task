resource "aws_s3_bucket" "backend" {
  bucket = "andr1yk-terraform-state"
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.backend.id

  versioning_configuration {
    status = "Enabled"
  }
}

