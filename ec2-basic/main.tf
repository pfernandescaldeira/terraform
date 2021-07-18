provider "aws" {
    region= "us-west-2"
    profile = "default"
}

resource "aws_key_pair" "paulo-key" {
    
    key_name = "paulo-key"
    public_key = "ssh-rsa "
}

resource "aws_security_group" "paulo-sg" {

  ingress {
      from_port = 0
      to_port   = 0
      protocol  = "-1"
      self      = true
  }

  ingress {
    description = "Inbound to SSH"
      from_port = 22
      to_port   = 22
      protocol  = "tcp"
      cidr_blocks= ["0.0.0.0/0"]
  }

  egress {
      cidr_blocks= ["0.0.0.0/0"]
      from_port = 0
      to_port   = 0
      protocol  = "-1"
  }
}

resource "aws_instance" "machine_1" {
  ami = "ami-0dc8f589abe99f538"
  instance_type = "t2.micro"
  key_name = "paulo-key"
  count=1
  tags = {
    "name" = "mch"
    "type" = "master"
  }
  security_groups = ["${aws_security_group.paulo-sg.name}"]
}