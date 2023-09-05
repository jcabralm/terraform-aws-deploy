provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "firt-vpc" {
  cidr_block = "10.0.0.0/16"
  tags       = { Name = "Dev" }
}
resource "aws_subnet" "subnet-1" {
  vpc_id     = aws_vpc.firt-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = { Name = "Dev-subnet" }
}

resource "aws_instance" "cm-server" {
  ami           = var.ami_id
  instance_type = var.aws_instance
  tags = {Name="myserver"}

}

