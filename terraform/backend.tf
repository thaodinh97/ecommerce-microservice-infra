terraform {
  backend "s3" {
    bucket = "ecommerce-state-bucket-tdinh"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
  }
}