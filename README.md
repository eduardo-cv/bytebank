Duvidas : Discord 

![image](https://user-images.githubusercontent.com/82802634/218651082-f8e7f959-f409-4b24-8b58-dc203791854c.png)


# Pré-requisitos - [Projeto Terraform - AWS - Byte Bank]

1 - Primeiro passo e ter uma conta na aws e depois criar um usuário com credenciais de preferencia <b>limite as polices </b> para um acesso mais restrito.

   OBS : Cuidado ao dar acesso a tudo Ex. Administrator Access este não é uma boa pratica de segurança.

  - abrir o painel e criar chave de acesso para regiao correspondente
  - poderia ser feito automatizado porem prefiri demonstrar desta maneira
  
  - ex. <b> par_virginia_linux </b> no formato pem na região da virginia
  - <b> par_ohio_linux </b>   no formato pem na região da ohio
  - <b> par_sa_linux </b>   no formato pem na região da são paulo

2 - Baixar o AWS CLI instalar

  - https://aws.amazon.com/pt/cli/

  AWS Command Line Interface (AWS CLI) instalada e configurada com as permissões necessárias. Para obter mais informações sobre isso, consulte <a href="https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-  install.html" rel="nofollow" _istranslated="1">esta documentação</a>.</li>

  
  ![image](https://user-images.githubusercontent.com/82802634/218651595-ce290db9-4910-4b83-b21b-3b1804894f36.png)

  
  - abra um terminal de sua preferencia e configurar o cli.
  
  - aws configure
  - 
  - colocar as chaves de credenciais do usuario
  
  ![image](https://user-images.githubusercontent.com/82802634/218652056-a49b01df-c2f8-49ec-989c-37441883b608.png)

  
3 - baixar o arquivo terraform

  - https://developer.hashicorp.com/terraform/downloads?product_intent=terraform

![image](https://user-images.githubusercontent.com/82802634/218653404-ee93a9e7-4ed9-4486-a857-b606c9e87452.png)

  Terraform instalado e configurado. Para obter mais informações sobre isso, consulte <a href="https://learn.hashicorp.com/tutorials/terraform/install-cli" rel="nofollow" _istranslated="1">esta documentação</a>.

4 - Criar uma pasta Ex. C:\terraform  descompactar o arquivo que foi baixado na pasta

5 - Criar a variavel de ambiente  Ex. C:\Terraform

![image](https://user-images.githubusercontent.com/82802634/218652625-5e240c2a-f162-4416-b740-52d54323723f.png)

![image](https://user-images.githubusercontent.com/82802634/218652731-29e126ad-ce3e-4233-b98d-9e80f78a7352.png)


6 - No visual studio code

![image](https://user-images.githubusercontent.com/82802634/218653702-ca191dea-ada0-4cd5-99a3-2942db548f35.png)


locals {
  region = "${var.regiao["us-east-2"]}" # Definer qual regiao usar "us-east-1" ou "us-east-2"
}

variable "cidr_meu_ip" {
  description = "Meu IP"
  type        = string
  default     = "0.0.0.0" # Trocar por seu ip real security acesso ssh
}

7 - Abra terminal de sua preferencia na pasta que vc baixou a infra

8 - terraform init 
  - para baixar os pacotes nescessários

![image](https://user-images.githubusercontent.com/82802634/218654096-1cb6d756-ae6d-4173-bbed-1ac5f8c6b864.png)

o resultado seria mais ou menos isso

![image](https://user-images.githubusercontent.com/82802634/218654232-e80666ea-e424-4546-9ff0-fab8642f2f0e.png)

9 - Criar um bucket na região da virginia Exemplo <b>"Exemplo-state-seu-projeto"</b> e depois substituir no arquivo <b>"main.tf"</b>

 - A criaçao do mesmo pode ser no painel ou via cli. O motivo da criação e gravar o estado da infra no bucket.
 
10 - No arquivo <b>"variaveis-config.tf"</b>

    web_number     =  Quant de instancias deseja criar.
 
11 - No arquivo <b>"variaveis-config.tf"</b> em cada recurso existe um parâmetro com o nome <b>"volume_size"</b>

 - Este se refere ao tamanho do disco que será criado na instancia.

12 - terraform apply --auto-approve
  - para criar a infra

<h3>Espero que tenha ajudado a entender o modelo que serve como base para criar sua infra.</h3>

**NOTA**: Os recursos criados podem gerar em custos em sua conta da AWS. Considere excluir os recursos criados assim que os testes forem concluídos. Para obter mais informações, consulte [Definição de preço da AWS](https://aws.amazon.com/pricing/).

<h3>Verifique se sua conta ainda se encontra no free-tier (Nível gratuito da AWS) </h3>

<h2> lembrando que o laboratório é apenas um teste se não esta usando a infra destruir </h2> 

terraform destroy --auto-approve



