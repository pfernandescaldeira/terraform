
#permite buscar informacoes em tempo de execucao
data "terraform_remote_state" "dev-default-sg" {

    #quantiade de vezes que o bloco vai ser executado
    #no caso, executa 1 vez em caso do ambiente ser dev
    #pois nao tenho sg em hom e prod
    count   = terraform.workspace == "dev" ? 1 : 0
    backend = "s3"

    config =  {
        bucket  = "paulo-tfstate"
        key     = "sg/terraform.tfstate"
        region  = "us-west-2"
        profile = "default"
    }
}


# data "aws_ami" "ubuntu" {

#     most_recent = true
#     owners = [ "self" ]

#     filter {
#         name = "name"
#         values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.24-amd64-server-*"]
#     }

#     filter {
#         name = "virtualization-type"
#         values = ["hvm"]
#     }

    
# }
