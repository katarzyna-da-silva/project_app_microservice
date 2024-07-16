# connection with aws
terraform {
  required_version = ">= 1.6.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      #version = ">= 4.65"
      version = ">= 5.31"
     }
  }
}

provider "aws" {
  region = var.aws_region
}
