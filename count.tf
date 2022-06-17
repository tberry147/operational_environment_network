
resource "aws_vpc" "kojitechs_vpc" {
  count = local.create_vpc ? length(var.cidr_block) : 0

  cidr_block           = var.cidr_block[count.index]
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support

  # tags = {
  #   Name = "kojitechs_vpc"
  # }
}

# Create Internet IGW
resource "aws_internet_gateway" "igw" {
  count  = local.create_vpc ? length(var.cidr_block) : 0
  vpc_id = local.vpc_id

  # tags = {
  #   Name = "kojitechs_igw"
  # }
}

# Create Public Subnet
resource "aws_subnet" "public_subnet" {
  count = local.create_vpc ? length(var.pub_subs) : 0

  vpc_id                  = local.vpc_id
  cidr_block              = var.pub_subs[count.index]
  map_public_ip_on_launch = true
  availability_zone       = element(var.pub_sub_az, count.index)
 
  # tags = {
  #   Name = "public_subnet_${count.index + 1}"
  # }
}

# Create Private Subnet
resource "aws_subnet" "private_subnet" {
  count = local.create_vpc ? length(var.prv_subs) : 0

  vpc_id                  = local.vpc_id
  cidr_block              = var.prv_subs[count.index]
  availability_zone       = element(var.prv_sub_az, count.index)
  
  # tags = {
  #   Name = "private_subnet_${count.index + 1}"
  # }
}

# Create Database Subnet
resource "aws_subnet" "db_subnet" {
  count = local.create_vpc ? length(var.db_subs) : 0

  vpc_id                  = local.vpc_id
  cidr_block              = var.db_subs[count.index]
  availability_zone       = element(var.db_sub_az, count.index)

  # tags = {
  #   Name = "database_subnet_${count.index + 1}" #appending AZ to the name of subnet.
  # }
}

# # Create Public Route Table
resource "aws_route_table" "pub_RT" {
  count = local.create_vpc ? 1 : 0

  vpc_id = local.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw[count.index].id
  }

  # tags = {
  #   Name = "kojitechs_pubRT"
  # }
}

# # Create a RT association for Public subnets
resource "aws_route_table_association" "public_subnet_rt" {
  count          = local.create_vpc ? length(var.pub_subs) : 0
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.pub_RT[0].id
}


# # Create a default RT
resource "aws_default_route_table" "default_RT" {
  count                  = local.create_vpc ? length(var.cidr_block) : 0
  default_route_table_id = aws_vpc.kojitechs_vpc[count.index].default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_GW[0].id #Nat Gateway  (private)
  }
  # tags = {
  #   Name = "default_RT"
  # }
}


#Create EIP
resource "aws_eip" "eip" {
  count      = local.create_vpc ? 1 : 0
  vpc        = true
  depends_on = [aws_internet_gateway.igw]

}

# Create Nat Gateway
resource "aws_nat_gateway" "nat_GW" {
  count         = local.create_vpc ? 1 : 0
  allocation_id = aws_eip.eip[0].id
  subnet_id     = aws_subnet.public_subnet[0].id

  # tags = {
  #   Name = "Nat_GW"
  # }
  depends_on = [aws_internet_gateway.igw]
}

