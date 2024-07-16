# Variables
# AWS Region
variable "aws_region" {
  description = "Region for aws"
  type = string
  default = "eu-west-3"  
}
# Environment Variable DEV
variable "environment" {
  description = "Environment"
  type = string
  default = "dev"
}
