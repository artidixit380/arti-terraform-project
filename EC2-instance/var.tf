
variable "ec2_region" {
  description = "AWS region where resources will be provisioned"
  default     = "us-east-1"
}

variable "ec2_ami_id" {
  description = "AMI ID for the EC2 instance"
  default     = "ami-0ecb62995f68bb549"
}

variable "ec2_instance_type" {
  description = "Instance type for the EC2 instance"
  default     = "t3.micro"
}

variable "my_enviroment" {
  description = "Instance type for the EC2 instance"
  default     = "dev"
}
