
module "networking" {
  source = "../"
  
  cidr_block = ["10.0.0.0/16"]
   pub_subs = ["10.0.0.0/24", "10.0.2.0/24",]
   prv_subs = ["10.0.1.0/24", "10.0.3.0/24"]
   db_subs = ["10.0.51.0/24", "10.0.53.0/24"]
   pub_sub_az = ["us-east-1a", "us-east-1b"]
   prv_sub_az = ["us-east-1a", "us-east-1b"]
   db_sub_az = ["us-east-1a", "us-east-1b"]
   
}