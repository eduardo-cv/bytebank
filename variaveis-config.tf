##########################################################
#  Obs : 
#  Porta 22 por segurança definida somente para seu ip.
##########################################################
locals {
  region = "sa-east-1"
}
##########################################################
#  Configuração VPC
##########################################################
locals {
  vpc_cidr_pref            = "10.1"
  vpc_azs_avaliable_count  = 2
  vpc_private_subnet_count = 2
  vpc_public_subnet_count  = 2
}
##########################################################
#  Configuração Projeto
##########################################################
locals {
  projeto_name = "bytebank"
  web_number   = 1
  # Load Balancer -> Somente para instancias web 
  # Definir false caso não deseje criar o Load Balancer
  create_lb = false
  # Definir false caso não deseje criar o RDS SQL SERVER
  create_rds = false
}
##########################################################
#  Configuração Grupo Segurança - Somente para meu IP
##########################################################
locals {
  ingress_cidr_blocks_ip = {
    #  definir true somente para seu ip.
    port-80  = true
    port-443 = true
  }
}
##########################################################
#  Configuração do RDS MYSQL
##########################################################
locals {
  rds_sqlserver = {
    # Definir como true se deseja criar o recurso.
    create                = local.create_rds
    identifier            = "rds-sqlserver-${local.projeto_name}"
    username              = "admin"     # Trocar aqui
    password              = "admin1234" # Trocar aqui
    instance_class        = "db.t3.micro"
    allocated_storage     = 20
    max_allocated_storage = 22
    availability_zones_db = "${local.region}a"
  }
}
##########################################################
#  Configuração da instancia WEB
##########################################################
locals {
  ec2_web = {
    # Informar a qtd de intancia desejada
    count               = local.web_number
    ami                 = data.aws_ami.amazon-linux-2023
    associate_public_ip = true
    instance_type       = "c6i.xlarge"
    key_name            = var.ec2_key_par["${local.region}"]
    volume_size         = 8
    sg_ids = [
      # Selecionar os security groups web
      aws_security_group.sg_ssh.id,
      aws_security_group.sg_port_80.id,
      aws_security_group.sg_port_443.id,
    ]
    tag_name = "web"
  }
}