variable "vpc_name" {
  type = string
  description = "Set the vpc_name"
}

variable "ssh_port" {
  type = number
  default = 22
}

variable "enabled" {
  type = bool
  default = true
}

variable "mylist" {
  type = list(string)
  default = ["a", "b", "c"]
}

variable "mymap" {
  type = map
  default = {
    key1 = "value1"
    key2 = "value2"
  }
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
