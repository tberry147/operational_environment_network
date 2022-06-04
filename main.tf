
# # Create a VPC
# resource "aws_vpc" "kojitechs_vpc" {
#   cidr_block           = var.cidr_block
#   enable_dns_hostnames = true
#   enable_dns_support   = true

#   tags = {
#     Name = "kojitechs_vpc"
#   }
# }

# # Create Internet IGW
# resource "aws_internet_gateway" "igw" {
#   vpc_id = local.vpc_id

#   tags = {
#     Name = "kojitechs_igw"
#   }
# }

# # Create Nat Gateway
# resource "aws_nat_gateway" "nat_GW" {
#   allocation_id = aws_eip.eip.id
#   subnet_id     = aws_subnet.private_subnet_1.id

#   tags = {
#     Name = "Nat_GW"
#   }
#   # To ensure proper ordering, it is recommended to add an explicit dependency
#   # on the Internet Gateway for the VPC.
#   depends_on = [aws_internet_gateway.igw]
# }

# resource "aws_eip" "eip" {
#   for_each   = aws_eip.eip
#   vpc        = true
#   depends_on = [aws_internet_gateway.igw]

# }

# # Create Public Subnet
# resource "aws_subnet" "public_subnet_1" {
#   vpc_id                  = local.vpc_id
#   cidr_block              = var.public_subnet[0]
#   map_public_ip_on_launch = true
#   availability_zone       = local.availability_zone[0]
#   tags = {
#     Name = "public_subnet_1${local.availability_zone[0]}"
#   }
# }

# resource "aws_subnet" "public_subnet_2" {
#   vpc_id                  = local.vpc_id
#   cidr_block              = var.public_subnet[1]
#   map_public_ip_on_launch = true
#   availability_zone       = local.availability_zone[1]
#   tags = {
#     Name = "public_subnet_2${local.availability_zone[1]}"
#   }
# }

# # Create Private Subnet
# resource "aws_subnet" "private_subnet_1" {
#   vpc_id            = local.vpc_id
#   cidr_block        = var.private_subnet[0]
#   availability_zone = local.availability_zone[0]

#   tags = {
#     Name = "private_subnet_1${local.availability_zone[0]}"
#   }
# }

# resource "aws_subnet" "private_subnet_2" {
#   vpc_id            = local.vpc_id
#   cidr_block        = var.private_subnet[1]
#   availability_zone = local.availability_zone[1]

#   tags = {
#     Name = "private_subnet_2${local.availability_zone[1]}" #Place value passed here
#   }
# }

# # Create Database Subnet
# resource "aws_subnet" "db_subnet_1" {
#   vpc_id            = local.vpc_id
#   cidr_block        = var.db_subnet[0]
#   availability_zone = local.availability_zone[0]
#   tags = {
#     Name = "db_subnet_1${local.availability_zone[0]}"
#   }
# }

# resource "aws_subnet" "db_subnet_2" {
#   vpc_id            = local.vpc_id
#   cidr_block        = var.db_subnet[1]
#   availability_zone = local.availability_zone[1]
#   tags = {
#     Name = "db_subnet_2${local.availability_zone[1]}"
#   }
# }

# # Create Public Route Table
# resource "aws_route_table" "pub_RT" {
#   vpc_id = local.vpc_id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = local.gateway_id
#   }

#   tags = {
#     Name = "kojitechs_pubRT"
#   }
# }

# # Create a default RT
# resource "aws_default_route_table" "default_RT" {
#   default_route_table_id = aws_vpc.kojitechs_vpc.default_route_table_id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_nat_gateway.nat_GW.id #Nat Gateway 
#   }
#   tags = {
#     Name = "default_RT"
#   }
# }

# # Create a RT association
# resource "aws_route_table_association" "public_subnet_1" {
#   subnet_id      = aws_subnet.public_subnet_1.id
#   route_table_id = aws_route_table.pub_RT.id
# }

# resource "aws_route_table_association" "public_subnet_2" {
#   subnet_id      = aws_subnet.public_subnet_2.id
#   route_table_id = aws_route_table.pub_RT.id
# }
