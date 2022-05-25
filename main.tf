
# Create a VPC

resource "aws_vpc" "kojitechs_vpc" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "kojitechs_vpc"
  }
}

# Create Public Subnet
resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = local.vpc_id
  cidr_block              = var.public_subnet[0]
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.az.names[0]
  tags = {
    Name = "public_subnet_1${data.aws_availability_zones.az.names[0]}"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = local.vpc_id
  cidr_block              = var.public_subnet[1]
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.az.names[1]
  tags = {
    Name = "public_subnet_2${data.aws_availability_zones.az.names[1]}"
  }
}

# Create Private Subnet
resource "aws_subnet" "private_subnet_1" {
  vpc_id            = local.vpc_id
  cidr_block        = var.private_subnet[0]
  availability_zone = data.aws_availability_zones.az.names[0]

  tags = {
    Name = "private_subnet_1${data.aws_availability_zones.az.names[0]}"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id            = local.vpc_id
  cidr_block        = var.private_subnet[1]
  availability_zone = data.aws_availability_zones.az.names[1]

  tags = {
    Name = "private_subnet_2${data.aws_availability_zones.az.names[1]}" #Place value passed here
  }
}

# Create Database Subnet
resource "aws_subnet" "db_subnet_1" {
  vpc_id            = local.vpc_id
  cidr_block        = var.db_subnet[0]
  availability_zone = data.aws_availability_zones.az.names[0]
  tags = {
    Name = "db_subnet_1${data.aws_availability_zones.az.names[0]}"
  }
}

resource "aws_subnet" "db_subnet_2" {
  vpc_id            = local.vpc_id
  cidr_block        = var.db_subnet[1]
  availability_zone = data.aws_availability_zones.az.names[1]
  tags = {
    Name = "db_subnet_2${data.aws_availability_zones.az.names[1]}"
  }
}