
terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.27.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_key_pair" "my_terra_key" {
  key_name   = "my_terra_key"
  public_key = file("terra-key.pub")
  
}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}
  
resource "aws_security_group" "automate_sg" {
    name        = "allow_ssh"
    description = "Allow SSH inbound traffic"
    vpc_id      = aws_default_vpc.default.id
     

    ingress {
      description      = "SSH from anywhere"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
}
    ingress {
      description      = "HTTP open"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      }

      egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        description      = "Allow all outbound traffic"
      }
      tags = {
        Name = "automate_sg"
      }
    }

resource "aws_instance" "new_instance" {
  ami                         = var.ec2_ami_id  
  instance_type               = var.ec2_instance_type
  key_name                    = aws_key_pair.my_terra_key.key_name
  vpc_security_group_ids      = [aws_security_group.automate_sg.id]
  user_data = file("install_nginx.sh")

   root_block_device {
    volume_size = 8
    volume_type = "gp3"
  }

   tags = {
    Name = "ServerInstance"
  }
    }
  