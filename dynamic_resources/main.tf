provider "aws" {
    region= "us-west-2"
    profile = "default"
}

resource "aws_key_pair" "paulo-key" {
    
    key_name = "paulo-key"
    public_key = "ssh-rsa "
}

resource "aws_security_group" "paulo-sg" {

    name        = "paulao-sg"
    description = "Utilizando Terraform"

    dynamic "ingress" {

        for_each = var.default_ingress
        content {
            description = ingress.value["description"]
            from_port   = ingress.key
            to_port     = ingress.key
            protocol    = "tcp"
            cidr_blocks = ingress.value["cidr_blocks"]
        }
    }

    tags = {
        Name = "Paulao"
    }
}

terraform {

    backend "s3" {
        bucket = "paulo-tfstate"
        key    = "sg/terraform.tfstate"
        region= "us-west-2"
        profile = "default"
    }
}

output id {
    value = aws_security_group.paulo-sg.id
    # value = "${aws_security_group.paulo-sg.id}"
}