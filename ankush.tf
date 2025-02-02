provider "aws" {
  region = "ap-south-1"
}
resource "aws_instance" "slave" {
  ami                    = "ami-01a4f99c4ac11b03c"
  instance_type          = "t2.micro"
  key_name               = "ANSH"
  availability_zone      = "ap-south-1a"
  vpc_security_group_ids = [aws_security_group.my-ec2-security.id]
  tags = {
    Environment = "dev"
    Name = "my-ec2-instance"
  }

  provisioner "local-exec" {
    command = "echo ${self.private_ip} > dev.ini"
  }
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
