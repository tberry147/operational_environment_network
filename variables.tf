
variable "region" {
  description = "The Region of the Provider"
  type        = string
  default     = "us-east-1"
}

variable "cidr_block" {
  description = "The CIDR of the VPC"
  type        = list(any)
  default     = ["10.0.0.0/16"]
}

variable "pub_subs" {
  description = "CIDR of Public Subnet"
  type        = list(any)
  default     = ["10.0.0.0/24", "10.0.2.0/24"]
}

variable "prv_subs" {
  description = "CIDR of Private Subnet"
  type        = list(any)
  default     = ["10.0.1.0/24", "10.0.3.0/24"]
}

variable "db_subs" {
  description = "CIDR of Database Subnet"
  type        = list(any)
  default     = ["10.0.51.0/24", "10.0.53.0/24"]
}

variable "instance_type" {
  description = "Type of the instance"
  type        = string
  default     = "t2.micro"
}


# creating variable for VPC
variable "create_vpc" {
  description = "Create VPC for Kojitech"
  type        = bool
  default     = true
}
