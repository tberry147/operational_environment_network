

# # Create Public Subnet with for_each
# resource "aws_subnet" "public_subnet" {
#   for_each = toset(var.public_subnet_cidr)
#   vpc_id                  = local.vpc_id
#   cidr_block              = each.value
#   map_public_ip_on_launch = true
#   availability_zone       = data.aws_availability_zones.az.names
# }

# # Create Private Subnet with for_each
# resource "aws_subnet" "private_subnet" {
#  for_each = toset(var.private_subnet_cidr)
#  vpc_id = local.vpc_id
#  cidr_block = each.value
# availability_zone = toset(data.aws_availability_zones.az.names)
# }  

# # Create Database Subnet with for_each
# resource "aws_subnet" "db_subnet" {
#   for_each = toset(var.db_subnet_cidr)
#   vpc_id                  = local.vpc_id
#   cidr_block              = each.value
#   availability_zone       = toset(data.aws_availability_zones.az.names)
#  }


# # Create a RT association
# resource "aws_route_table_association" "public_subnet" {
#   for_each = aws_subnet.public_subnet
#   subnet_id      = each.value.id
#   route_table_id = aws_route_table.pub_RT.id
# }

# # Create Nat Gateway
# resource "aws_nat_gateway" "nat_GW" {
#   for_each = aws_subnet.private_subnet
#       allocation_id = aws_eip.eip[each.key].id
#   subnet_id = aws_subnet.private_subnet[each.key].id

#   tags = {
#     Name = "Nat_GW"
#   }
#   # To ensure proper ordering, it is recommended to add an explicit dependency
#   # on the Internet Gateway for the VPC.
#   depends_on = [aws_internet_gateway.igw]
# }

# #Create a default RT
# resource "aws_default_route_table" "default_RT" {
#   for_each = aws_nat_gateway.nat_GW
#         default_route_table_id = aws_vpc.kojitechs_vpc.default_route_table_id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_nat_gateway.nat_GW[each.key].id #Nat Gateway 
#   }
#   tags = {
#     Name = "default_RT"
#   }
# }