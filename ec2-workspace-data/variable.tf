variable "ambiente_regiao" {
    type = map(string)

    default = {
      default = "us-west-2"
      dev     = "us-west-2"
      hom     = "us-west-2"
      prod    = "us-west-2"
    }
}

#criacao de funcoes 
locals {
  region = lookup(var.ambiente_regiao, terraform.workspace )
}
