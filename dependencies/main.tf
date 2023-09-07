provider "aws" {
  region = "eu-west-1"
  shared_config_files      = ["/Users/guillemcasanova/.aws/conf"]
  shared_credentials_files = ["/Users/guillemcasanova/.aws/creds"]
  profile                  = "personal"
}

resource "aws_instance" "ec2web" {
  ami = "ami-"
  instance_type = "t2-micro"
  tags = {
    Name = "Web server"
  }

  depends_on = [ aws_instance.es2db ]
}

resource "aws_instance" "ec2db" {
  ami = "ami-"
  instance_type = "t2-micro"
  tags = {
    Name = "DB server"
  }
}

data "aws_instance" "searchdb" {
  filter {
    name = "tag:Name"
    values = ["DB server"]
  }
}

output "DB info" {
  value = data.aws_instance.searchdb.availability_zone
}