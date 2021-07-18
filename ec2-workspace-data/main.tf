provider "aws" {
  region = local.region
  profile = "default"
}


resource "aws_instance" "web" {
    
    ami = "ami-0dc8f589abe99f538" #data.aws_ami.ubuntu.id
    instance_type = "t2.micro"
    vpc_security_group_ids = terraform.workspace == "dev" ? [data.terraform_remote_state.dev-default-sg[0].outputs.id] : []

    tags = {
        Name = "HelloWord"
        Env  = terraform.workspace
    }
}

  
