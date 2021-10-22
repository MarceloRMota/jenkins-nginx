provider "aws" {
  region = "sa-east-1"
}


resource "aws_instance" "maquina_nginx_mmota" {
  ami                         = "ami-054a31f1b3bf90920"
  instance_type               = "t2.micro"
  subnet_id                   = "subnet-0a7ce1b942558345a"
  key_name                    = "key-mmotadev"
  associate_public_ip_address = true
  tags = {
    Name = "maquina_ansible_com_nginx"
  }
    root_block_device {
    volume_size           = "10"
    volume_type           = "gp2"
    encrypted             = true
    delete_on_termination = true
  }
  vpc_security_group_ids = ["${aws_security_group.acessos.id}"]
}

resource "aws_security_group" "acessos" {
  name        = "acessos_nginx"
  description = "acessos inbound traffic"
  vpc_id = "vpc-0581d08eb6f432641"

  ingress = [
    {
      description      = "SSH from VPC"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids = null,
      security_groups: null,
      self: null
    },
    {
      description      = "Acesso HTTPS"
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids = null,
      security_groups: null,
      self: null
    },
    {
      description      = "Acesso HTTP"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids = null,
      security_groups: null,
      self: null
    }
  ]

  egress = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"],
      prefix_list_ids = null,
      security_groups: null,
      self: null,
      description: "Libera dados da rede interna"
    }
  ]

  tags = {
    Name = "allow_ssh"
  }
}
# terraform refresh para mostrar o ssh
output "aws_instance_e_ssh" {
  value = [
    aws_instance.maquina_nginx_mmota.public_dns
  ]
}