provider "aws" {
  region = "eu-west-1"
}

variable "ingress_rules" {
  type = list(number)
  default = [22, 80, 443]
}

variable "egress_rules" {
  type = list(number)
  default = [0, 80, 443]
}
  
resource "aws_security_group" "web_traffic" {
  name = "Secure server"
  description = "Allow inbound traffic"
  dynamic "ingress" {
    iterator = port
    for_each = var.ingress_rules
    content {
      from_port = port.value
      to_port = port.value
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    iterator = port
    for_each = var.egress_rules
    content {
      from_port = port.value
      to_port = port.value
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

resource "aws_instance" "myec2db" {
  instance_type = "t2.micro"
  ami = "ami-0d5eff06f840b45e9"
  security_groups = [aws_security_group.web_traffic.name]
  tags = {
    Name = "myec2db"
  }
}

