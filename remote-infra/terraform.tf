terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.27.0"
    }
  }
  backend "s3" {
    bucket         = "new-unique-us-east-1-bucket-2025"
    key            = "terraform.tfstate"  #path or name of statefile
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock"
    encrypt = true

}
}


