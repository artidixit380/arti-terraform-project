
resource "aws_dynamodb_table" "terraform_locks" {
  name         = "state-lock-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockId"

  attribute {
    name = "LockId"
    type = "S"
  }

  tags = {
    Name = "terraform-state-lock"
  }
}
