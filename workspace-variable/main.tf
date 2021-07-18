variable "ambiente" {
  
    type = map(string)
    description = "Mapa que define em qual ambiente estamos"

    default = {
        default = "Esse eh o ambiente padrao"
        dev     = "Esse eh o ambiente de desenvolvimento"
        hom     = "Esse eh o ambiente de homologacao"
        prod    = "Esse eh o ambiente de producao"
    }
}

locals {
  exp_env = lookup (var.ambiente, terraform.workspace)
}

output "ambiente_atual" {
  value = local.exp_env
}