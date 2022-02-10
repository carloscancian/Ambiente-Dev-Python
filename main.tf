terraform {
  required_providers {
      aws = {
          source ="hashicorp/aws"
          version = "~> 3.27"
      }
  }

  required_version = ">= 0.14.9"

}

provider "aws" {
    region = "us-west-1"
}

resource "aws_instance" "app_server" {
  ami            = "ami-01f87c43e618bf8f0"
  instance_type  = "t2.micro"  
  key_name = "Chave-T-E"
  # user_data = <<-EOF
  #               #!/bin/bash
  #               cd /home/ubuntu
  #               echo "<h1>Feito com terraform</h1>" > index.html
  #               nohup busybox httpd -f -p 8080 &
  #               EOF
  tags = {
    Name = "AppPython"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ss.id}"]
}