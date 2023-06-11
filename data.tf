##########################################################
#  Obtenha o ip address automáticos com este request
##########################################################
data "http" "ip_address" {
  url    = "https://ipinfo.io/"
  method = "GET"
  request_headers = {
    Accept = "application/json"
  }
}
##########################################################
#  Obtenha o Amazon Linux 2023 AMI kernel-6.1
##########################################################
data "aws_ami" "amazon-linux-2023" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["al2023-ami-2023.0.20230607.0-kernel-6.1-x86_64"]
  }
}
##########################################################
#  Obtenha o Amazon Linux 2 AMI kernel-5.10
##########################################################
data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm*"]
  }
}
##########################################################
#  Obtenha o Ubuntu Linux 22.04 AMI 20230208
##########################################################
data "aws_ami" "ubuntu-22" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20230516"]
  }
}
##########################################################
#  Obtenha o Debian Linux 11 AMI amd64-20230124-1270
##########################################################
data "aws_ami" "debian-11" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["debian-11-amd64-*"]
  }
}
##########################################################