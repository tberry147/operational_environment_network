

# # Create Public Subnet
# resource "aws_subnet" "pub_sub" {
#  for_each = local.create_vpc ? local.public_subnet : {}

#   vpc_id                  = local.vpc_id
#   cidr_block              = each.value.cidr_block
#   availability_zone       = each.value.availability_zone
#   map_public_ip_on_launch = true
#   tags = {
#     Name = each.key
#       }
# }

# # Create Private Subnet
# resource "aws_subnet" "private_sub" {
#  for_each = local.create_vpc ? local.private_subnet : {}

#   vpc_id                  = local.vpc_id
#   cidr_block              = each.value.cidr_block
#   availability_zone       = each.value.availability_zone
#     tags = {
#     Name = each.key
#       }
# }

# # Create DB Subnet
# resource "aws_subnet" "db_sub" {
#  for_each = local.create_vpc ? local.db_subnet : {}

#   vpc_id                  = local.vpc_id
#   cidr_block              = each.value.cidr_block
#   availability_zone       = each.value.availability_zone
#     tags = {
#     Name = each.key
#       }
# }

# # # # Create Public Route Table
# resource "aws_route_table" "pub_RT" {
#   for_each = local.create_vpc ? local.public_subnet : {}

#   vpc_id = local.vpc_id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_nat_gateway.nat_GW[0].id
#   }

#   tags = {
#     Name = "kojitechs_pubRT"
#   }
# }

# # # # Create a RT association
# resource "aws_route_table_association" "public_subnet" {
#   for_each = local.create_vpc ?  toset(keys(aws_subnet.pub_sub)) : {} # toset(keys(aws_subnet.pub_sub))
#   subnet_id      = aws_subnet.pub_sub[each.key].id
#   route_table_id = aws_route_table.pub_RT[each.key].id
# }

# # #Create EIP
# resource "aws_eip" "eip" {
#   for_each =  aws_eip.eip
#   vpc        = true
#   depends_on = [aws_internet_gateway.igw]
# }


# # # Create Nat Gateway
# resource "aws_nat_gateway" "nat_GW" {
#   for_each = local.create_vpc ? local.private_subnet : {}
#       allocation_id = each.value.eip[each.key].id
#   subnet_id = local.private_subnet[each.key].id

#   tags = {
#     Name = "Nat_GW"
#   }
#   # To ensure proper ordering, it is recommended to add an explicit dependency
#   # on the Internet Gateway for the VPC.
#   depends_on = [aws_internet_gateway.igw]
# }

# # #Create a default RT
# resource "aws_default_route_table" "default_RT" {
#   for_each = local.create_vpc ? local.vpc_id : 0
#         default_route_table_id = aws_vpc.kojitechs_vpc[each.key].default_route_table_id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_nat_gateway.nat_GW[each.key].id #Nat Gateway 
#   }
#   tags = {
#     Name = "default_RT"
#   }
# }