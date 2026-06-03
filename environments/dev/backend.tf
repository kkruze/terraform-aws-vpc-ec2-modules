terraform {
  backend "s3" {
    bucket       = "kruze-terraform-state-kkruze"
    key          = "dev/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
  }
}
