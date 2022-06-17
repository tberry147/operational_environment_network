
module "networking" {
  source = "../"
  #   source = "git::https://github.com/tberry147/operational_environment_network.git"

  cidr_block = var.vpc_cidr
  pub_subs   = var.public_sub
  prv_subs   = var.private_sub
  db_subs    = var.database_sub
  pub_sub_az = ["us-east-1a", "us-east-1b"]
  prv_sub_az = ["us-east-1a", "us-east-1b"]
  db_sub_az  = ["us-east-1a", "us-east-1b"]

}