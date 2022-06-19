
module "networking" {
  source = "../"
  #   source = "git::https://github.com/tberry147/operational_environment_network.git"

  cidr_block = var.vpc_cidr
  pub_subs   = var.public_sub
  prv_subs   = var.private_sub
  db_subs    = var.database_sub
  pub_sub_az = var.pub_sub_az
  prv_sub_az = var.prv_sub_az
  db_sub_az  = var.db_sub_az

}