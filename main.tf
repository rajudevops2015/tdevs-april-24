provider "aws" {
}


# data "aws_ami" "my_ami" {
#   most_recent = true
#   owners      = ["amazon"]

#   filter {
#     name   = "name"
#     values = ["amzn2-ami-hvm*"]
#   }

# }

# resource "aws_instance" "dev" {
#   ami           = data.aws_ami.my_ami.id
#   instance_type = "t2.micro"

# }

# resource "aws_instance" "prod" {
#   ami           = "ami-0cd59ecaf368e5ccf"
#   instance_type = "m5.large"
#   tags = local.tags
# }



# locals {
#   tags = {
#     Team = "infra"
#     service = "frontend" 
#   }
# }

# resource "aws_iam_user" "lb" {
#   name = var.username[count.index]
#   path = "/system/"
#   count = 3
# }


# resource "aws_eip" "myip" {
#     domain = "vpc"

# }

# resource "aws_eip_association" "eip_assoc" {
#   instance_id   = aws_instance.test.id
#   allocation_id = aws_eip.myip.id
# }

# variable "sg_ports" {
#   type = list(number)
#   default = [ 443, 80, 22, 8080, 8081, 500, 29, 38, 3421 ]
# }


# resource "aws_security_group" "mysg" {
#     name = "dynamic-sg"

#     dynamic "ingress" {
#       for_each = var.sg_ports
#       content {
#         from_port = ingress.value
#         to_port = ingress.value
#         protocol = "tcp"
#         cidr_blocks = ["0.0.0.0/0"]
#       }
      
#     }
# }


# resource "aws_instance" "prod" {
#   ami           = "ami-0a1179631ec8933d7"
#   instance_type = "t2.small"
#   key_name = "raju1603"
  
#   connection {
#     type     = "ssh"
#     user     = "ec2-user"
#     private_key = file("./raju1603.pem")
#     host     = self.public_ip
#   }

#   provisioner "file" {
#     source      = "./index.html"
#     destination = "/tmp/index.html"
#   }

#   provisioner "remote-exec" {
#     inline = [
#       "sudo yum update -y ",
#       "sudo amazon-linux-extras install nginx1 -y",
#       "sudo rm -rf  /usr/share/nginx/html/index.html",
#       "sudo cp -r /tmp/index.html /usr/share/nginx/html/",
#       "sudo systemctl start nginx",
#     ]
#   }
# }

# resource "aws_instance" "prod" {
#   ami           = "ami-0a1179631ec8933d7"
#   instance_type = "t2.small"
#   key_name = "raju1603"

#   provisioner "local-exec" {
#     command = "echo ${aws_instance.prod.public_ip} >> public_ip.txt"
    
#   }

# }


# resource "aws_security_group" "mysg" {
#     name = "tdevs-allow-ssh.sg"

#     ingress {
#       from_port = 22
#       to_port = 22
#       protocol = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]
#     }
# }

# resource "aws_instance" "prod" {
#   ami           = "ami-0a1179631ec8933d7"
#   instance_type = "t2.small"
#   key_name = "raju1603"
#   vpc_security_group_ids = [aws_security_group.mysg.id]
  
#   connection {
#     type     = "ssh"
#     user     = "ec2-user"
#     private_key = file("./raju1603.pem")
#     host     = self.public_ip
#   }

#   provisioner "remote-exec" {
#     when = destroy
#     on_failure = continue
#     inline = [
#       "sudo yum remove maven -y",
#     ]
#   }
# }

variable "region" {
  default = "us-east-1"
}

variable "tags" {
  type = list
  default = ["dev-env","prod-env"]
}

variable "ami" {
  type = map
  default = {
    "us-east-1" = "ami-04ff98ccbfa41c9ad"
    "us-west-2" = "ami-0a283ac1aafe112d5"
    "ap-south-1" = "ami-0e4fd655fb4e26c30"
  }  
}

resource "aws_instance" "dev-ec2" {
  ami = lookup(var.ami,var.region)
  instance_type = "t2.micro"
  count = 2

  tags = {
    Name = element(var.tags,count.index)
  }
  
}