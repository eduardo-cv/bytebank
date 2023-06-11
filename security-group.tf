##########################################################
#  Grupo de Segurança -> 80
##########################################################
resource "aws_security_group" "sg_port_80" {
  description = "Acesso a porta 80"
  vpc_id      = module.vpc.vpc_id
  name        = "sg_port_80"
  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = local.ingress_cidr_blocks_ip.port-80 ? ["${local.remote_address.ip}/32"] : ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0", ]
  }
  tags = {
    Name = "terraform_port_80"
  }
}
##########################################################
#  Grupo de Segurança -> sg_cloudflare
##########################################################
resource "aws_security_group" "sg_cloudflare" {
  description = "Acesso a porta 443"
  vpc_id      = module.vpc.vpc_id
  name        = "sg_cloudflare"
  ingress {
    protocol         = "tcp"
    from_port        = 443
    to_port          = 443
    cidr_blocks      = var.allowed_ipv4_cloudflare
    ipv6_cidr_blocks = var.allowed_ipv6_cloudflare
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0", ]
  }
  tags = {
    Name = "terraform_sg_cloudflare"
  }
}
##########################################################
#  Grupo de Segurança -> 443
##########################################################
resource "aws_security_group" "sg_port_443" {
  description = "Acesso a porta 443"
  vpc_id      = module.vpc.vpc_id
  name        = "sg_port_443"
  ingress {
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
    cidr_blocks = local.ingress_cidr_blocks_ip.port-443 ? ["${local.remote_address.ip}/32"] : ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0", ]
  }
  tags = {
    Name = "terraform_port_443"
  }
}
##########################################################
#  Grupo de Segurança -> SSH
##########################################################
resource "aws_security_group" "sg_ssh" {
  description = "Acesso a porta 22"
  vpc_id      = module.vpc.vpc_id
  name        = "sg_ssh"
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["${local.remote_address.ip}/32"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0", ]
  }
  tags = {
    Name = "terraform_sg_ssh"
  }
}
##########################################################
#  Grupo de Segurança -> MYSQL
##########################################################
resource "aws_security_group" "sg_rds_sql_server" {
  description = "Acesso a rds sql server"
  vpc_id      = module.vpc.vpc_id
  name        = "sg_rds_sql_server"
  ingress {
    protocol    = "tcp"
    from_port   = 1433
    to_port     = 1433
    cidr_blocks = ["${local.remote_address.ip}/32"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0", ]
  }
  tags = {
    Name = "terraform_sg_rds_sql_server"
  }
}