
resource "aws_s3_bucket" "state_bucket" {
  bucket =  "new-unique-us-east-1-bucket-2025"


  tags = {
    Name        = "terraform-state"
    Environment = "dev"
  }
}
