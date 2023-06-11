##########################################################
# Par de chaves existentes na AWS
##########################################################
variable "ec2_key_par" {
  type = map(string)
  default = {
    "us-east-1" = "par_virginia_linux"
    "us-east-2" = "par_ohio_linux"
    "sa-east-1" = "par-sa-linux"
  }
}
##########################################################
# 
##########################################################
variable "instance_type" {
  type = map(string)
  default = {
    "t2.micro" = "t2.micro"
    "t3.small" = "t3.small"
    "c6i.xlarge" = "c6i.xlarge"
  }
}
##########################################################
# 
##########################################################
variable "db_storage_type" {
  type = map(string)
  default = {
    "gp2" = "gp2"
    "gp3" = "gp3"
    "io1" = "io1"
  }
}
##########################################################
# Lista CloudFlare -> ipv4
##########################################################
variable "allowed_ipv4_cloudflare" {
  type = list(string)
  default = [
    "103.21.244.0/22",
    "103.22.200.0/22",
    "103.31.4.0/22",
    "104.16.0.0/13",
    "104.24.0.0/14",
    "108.162.192.0/18",
    "131.0.72.0/22",
    "141.101.64.0/18",
    "162.158.0.0/15",
    "172.64.0.0/13",
    "173.245.48.0/20",
    "188.114.96.0/20",
    "190.93.240.0/20",
    "197.234.240.0/22",
    "198.41.128.0/17"
  ]
}
##########################################################
# Lista CloudFlare -> ipv6
##########################################################
variable "allowed_ipv6_cloudflare" {
  type = list(string)
  default = [
    "2400:cb00::/32",
    "2606:4700::/32",
    "2803:f800::/32",
    "2405:b500::/32",
    "2405:8100::/32",
    "2a06:98c0::/29",
    "2c0f:f248::/32"
  ]
}
##########################################################