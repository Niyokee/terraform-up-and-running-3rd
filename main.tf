provider "aws" {
  region = "ap-northeast-1"
}

terraform {
  backend "s3" {
    bucket = "terraform-up-and-running-state-2022-05-10"
    key    = "global/s3/terraform.tfstate"
    region = "ap-northeast-1"

    dynamodb_table = "terraform-up-and-running-locks-2022-05-10"
    encrypt        = true
  }
}