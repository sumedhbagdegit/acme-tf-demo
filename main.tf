terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  cloud {
    organization = "sumedhhashi"

    workspaces {
      name = "acme-prod-web"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0" # Replace with a valid AMI for your region
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform-Web-Instance"
    Env  = "Production"
  }
}
