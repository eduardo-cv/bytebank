##########################################################
#             EC2 instance - [web]              
##########################################################
resource "aws_instance" "web" {
  count                       = local.ec2_web.count
  ami                         = local.ec2_web.ami.id
  instance_type               = local.ec2_web.instance_type
  vpc_security_group_ids      = local.ec2_web.sg_ids
  subnet_id                   = local.pub_subnet_ids.web[count.index]
  associate_public_ip_address = local.ec2_web.associate_public_ip
  key_name                    = local.ec2_web.key_name

  user_data = <<-EOF
    ${file("./files-user-data/user-data-web.sh")}
  EOF 

  ebs_block_device {
    device_name = "/dev/xvda"
    volume_size = local.ec2_web.volume_size
  }

  depends_on = [module.vpc]

  tags = {
    Name = local.ec2_web.tag_name
  }
}
##########################################################