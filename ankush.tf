provider "aws" {
  region = "ap-south-1"
}
resource "aws_instance" "slave" {
  ami                    = "ami-01a4f99c4ac11b03c"
  instance_type          = "t2.micro"
  key_name               = "tomcat"
  availability_zone      = "ap-south-1a"
  vpc_security_group_ids = [aws_security_group.my-ec2-security.id]
  tags = {
    Name = "my-ec2-instance"
  }

  provisioner "local-exec" {
    command = "echo ${aws_instance.slave.private_ip} >> ankush.ini"
  }
}
resource "aws_key_pair" "master" {
  key_name   = "tomcat"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC0yNhKkytDt+RkH3Sru2p7eGqOm1x1s/4lDUn46/LwbgjMQ2jQHf06jv4bOxtDTcl9gYWtjRtHcTHQuqiP7xLjICjnH0d18FiOtxj8QBP0NWMSTDV2yIePZyB5xwuO7AVKzg62AsdLMl/QgzFtXxhwHT4P34135hQ4DFpCSavbAs2dgp7D+bZ1LAtyCUp+hZCGceXtbfcG2AN+BfnrSS2iag3uYiOyV625vwJB85OPl9kLxRZO0CRVPbVHDH0ER/pRviU35qvZWI4IfDGkP0a7HNl7b3He11P1/GO5Q0YQbmuSTM/OglwKUe3+y82MB9ub3RMwfOcEhFMQU2B8a8YT root@ip-172-31-5-241.ap-south-1.compute.internal"
}
resource "aws_security_group" "my-ec2-security" {
  name = "my-ec2-security"

  ingress {
    description = "Allow port 22 - inbound"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow port 8080 - inbound"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
