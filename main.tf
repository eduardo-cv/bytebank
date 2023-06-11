##########################################################
#  Terraform -> Main
##########################################################
terraform {
  required_version = ">= 1.3.9"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.45.0"
    }
    http = ">= 3.2.1"
  }
  # Remote-State
  backend "s3" {
    region  = "sa-east-1"
    bucket  = "*******-terraform-state-sp" # Trocar aqui pelo seu bucket
    key     = "dev/v*****/api/terraform.tfstate"  # Trocar aqui pelo seu bucket
    encrypt = true
  }
}
##########################################################
#  Provedor AWS
##########################################################
provider "aws" {
  region = local.region
}
##########################################################
#  Comandos do terraform
##########################################################

# terraform init
# terraform apply --auto-approve
# terraform destroy --auto-approve
# terraform fmt -recursive
# terraform show
