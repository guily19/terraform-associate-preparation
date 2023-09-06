provider "aws" {
  region = "eu-west-1"
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
