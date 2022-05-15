provider "aws" {
  region = "us-east-2"
}

terraform {
  backend "s3" {
    bucket = "terraform-up-and-running-state-2022-05-10"
    key    = "stage/data-stores/mysql/terraform.tfstate"
    region = "ap-northeast-1"

    dynamodb_table = "terraform-up-and-running-locks-2022-05-10"
    encrypt        = true
  }
}

resource "aws_db_instance" "example" {
  allocated_storage   = 10
  identifier_prefix  = "terraform-up-and-running"
  engine              = "mysql"
  instance_class      = "db.t2.micro"
  skip_final_snapshot = true
  db_name             = "example_database"

  username = var.db_username
  password = var.db_password
}