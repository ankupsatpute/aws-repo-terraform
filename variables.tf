variable "aws_region" {
  description = "The AWS region to create things in."
  default     = "ap-south-1"
}

variable "key_name" {
  description = " SSH keys to connect to ec2 instance"
  default     =  "New1"
 // public_key     =  "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDM19Ir3cWSbg1OMbXfOcBszjNzGAf7uMtWcYcaI+kUN4J+2NRr84fVHjBrJh1tqkWdG2rt6+S9fvuFbPEobxDhbrkiqyZGxF3nroYFzAskotatbzM+mmbARq48T0WdGTdcVECVR6bFIgN1YFwi61XRCsdS4lYIQLdv1yMrL3wFjclsDJCl8DXF2H2TpAqhQXYQqK5G6jNOYbTZAzO7bH/1ykMPGYufAACAijh6YS6n5NJRALprrAaPEaFkiVD0GDCMjF/cQDqXxGnnnt/vWyWSFZGnHLBNSKVTdZYcJp4+KCTw31deRloMT1Fgc59Yq6nZFHKPb8VeCBNofn2gddoQ480PtqQvvu+53T0sUVPSj993pSXHANA/p1qq5mIFFp98FkEZtnDZp2P1bqdtuNGOYvfqNXDBDQz4Kqu0/yvjeoGTfSnFpH2jpMsLj/ob07j5DhOFZnIM1dHL9oegALg7HJ5TFH8NuFL3FIllc/GlIBq0ryit0++n3VRbccw5CzM= ubuntu@ip-172-31-32-151"
  
}

variable "instance_type" {
  description = "instance type for ec2"
  default     =  "t2.micro"
}

variable "security_group" {
  description = "Name of security group"
  default     = "my-terraform-security-group"
}

variable "tag_name" {
  description = "Tag Name of for Ec2 instance"
  default     = "my-ec2-instance"
}

variable "ami_id" {
  description = "AMI for Ubuntu Ec2 instance"
  default     = "ami-06984ea821ac0a879"
}
