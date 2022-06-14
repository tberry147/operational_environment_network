
# # # Create Instance
# # resource "aws_instance" "web" {
# #   ami                    = data.aws_ami.ami.id
# #   instance_type          = var.instance_type
# #   subnet_id              = var.public_subnet_cidr.id
# #   key_name               = data.aws_key_pair.mykey.key_name
# #   vpc_security_group_ids = [aws_security_group.allow_ssh.id]
# # }

# #Create Security Group
# resource "aws_security_group" "allow_ssh" {
#   name        = "allow_ssh"
#   description = "Allow ssh inbound traffic"
#   vpc_id      = local.vpc_id

#   ingress {
#     description = "TLS from VPC"
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = ["107.15.242.60/32"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]

#   }

#   tags = {
#     Name = "allow_tls"
#   }
# }