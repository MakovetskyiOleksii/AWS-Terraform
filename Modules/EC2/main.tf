terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "eu-central-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0c956e207f9d113d5"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-08fe9e27d62e386c7"]
  subnet_id              = "subnet-0725f76b64ae5e26c"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
