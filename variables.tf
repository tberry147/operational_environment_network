
variable "region" {
  description = "The Region of the Provider"
  type        = string
  default     = "us-east-1"
}

variable "cidr_block" {
  description = "The CIDR of the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet" {
  description = "CIDR of Public Subnet"
  type        = list(any)
  default     = ["10.0.0.0/24", "10.0.2.0/24"]
}

variable "private_subnet" {
  description = "CIDR of Private Subnet"
  type        = list(any)
  default     = ["10.0.1.0/24", "10.0.3.0/24"]
}

variable "db_subnet" {
  description = "CIDR of Database Subnet"
  type        = list(any)
  default     = ["10.0.51.0/24", "10.0.53.0/24"]
}

variable "instance_type" {
  description = "Type of the instance"
  type = string
  default = "t2.micro"
}