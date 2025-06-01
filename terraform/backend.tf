terraform {
  backend "s3" {
    bucket       = "to-bucket-f"
    key          = "global/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
    profile      = "to-tf"
    encrypt      = true
  }
}
