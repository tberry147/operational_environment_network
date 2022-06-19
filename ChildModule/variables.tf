
variable "region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR of each VPC"
  type = list
  default = []

}

variable "public_sub" {
  description = "Public Subnet"
  type = list
  default = []

}

variable "private_sub" {
  description = "Private Subnet"
  type = list
  default = []
}

variable "database_sub" {
  description = "database Subnet"
  type = list
  default = []
}

variable "pub_sub_az" {
  description = "Public Subnet AZ"
  type = list
  default = []
}

variable "prv_sub_az" {
  description = "Private Subnet AZ"
  type = list
  default = []
}

variable "db_sub_az" {
  description = "Database Subnet AZ"
  type = list
  default = []
}