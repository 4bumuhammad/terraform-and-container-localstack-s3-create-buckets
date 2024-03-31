provider "aws" {
  region                      = "ap-southeast-3"
  access_key                  = "0"
  secret_key                  = "0"
  s3_use_path_style           = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    s3 = "http://localhost:4566"
  }
}

resource "aws_s3_bucket" "b" {
  bucket = "muhammad-bucket-terraform"
  acl    = "public-read"
}