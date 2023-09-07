provider "aws" {
  region = "eu-west-1"
  shared_config_files      = ["/Users/guillemcasanova/.aws/conf"]
  shared_credentials_files = ["/Users/guillemcasanova/.aws/creds"]
  profile                  = "personal"
}
variable "vpc_name" {
  type = string
  description = "Set the vpc_name"
}

resource "aws_vpc" "myvpc" {
  tags = {
    Name = var.vpc_name
  }
  cidr_block = "10.0.0.0/16"
}

output "vpc_id" {
  value = aws_vpc.myvpc.id
}
