resource "aws_dynamodb_table" "terraform_locks" {
  hash_key     = "LockID"
  name         = "terraform-up-and-running-locks-2022-05-10"
  billing_mode = "PAY_PER_REQUEST"
  attribute {
    name = "LockID"
    type = "S"
  }
}

output "dynamodb_table_name" {
  value       = aws_dynamodb_table.terraform_locks.name
  description = "The name of the DynamoDB table"
}