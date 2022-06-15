
locals {
  # mandatory_tag = {
  #   line_of_business        = "hospital"
  #   ado                     = "max"
  #   tier                    = "WEB"
  #   operational_environment = upper(terraform.workspace)
  #   tech_poc_primary        = "udu.udu25@gmail.com"
  #   tech_poc_secondary      = "udu.udu25@gmail.com"
  #   application             = "http"
  #   builder                 = "udu.udu25@gmail.com"
  #   application_owner       = "kojitechs.com"
  #   vpc                     = "WEB"
  #   cell_name               = "WEB"
  #   component_name          = "kojitechs"
  # }
  vpc_id            = try(aws_vpc.kojitechs_vpc[0].id, "")
  create_vpc        = var.create_vpc
  # availability_zone = data.aws_availability_zones.az.names

  public_subnet = {
    subnet_1 = {
      cidr_block        = var.pub_subs[0]
      # availability_zone = local.availability_zone[0]
      availability_zone = var.pub_sub_az[0]
      subnet_2 = {
        cidr_block        = var.pub_subs[1]
        availability_zone = var.pub_sub_az[1]
        # availability_zone = local.availability_zone[1]
      }
    }

  }
  private_subnet = {
    subnet_1 = {
      cidr_block        = var.prv_subs[0]
      availability_zone = var.prv_sub_az[0]
      # availability_zone = local.availability_zone[0]
    }
    subnet_2 = {
      cidr_block        = var.prv_subs[1]
      availability_zone = var.prv_sub_az[1]
      # availability_zone = local.availability_zone[1]
    }

  }
  db_subnet = {
    subnet_1 = {
      cidr_block        = var.db_subs[0]
      # availability_zone = local.availability_zone[0]
      availability_zone = var.db_sub_az[0]
    }
    subnet_2 = {
      cidr_block        = var.db_subs[1]
      # availability_zone = local.availability_zone[1]
      availability_zone = var.pub_sub_az[1]
    }
  }
}
