
# data "aws_availability_zones" "az" {
#   state = "available"

# }

data "aws_ami" "ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*-gp2"]
  }
}

data "aws_key_pair" "mykey" {
  key_name = "Key"
}