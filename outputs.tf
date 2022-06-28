
output "vpc_id" {
  value = try(aws_vpc.kojitechs_vpc[0].id, "")
  description = "Kojitechs VPC ID"
}

output "public_subnet" {
    description = "Public subnet of Kojitechs"
  value = aws_subnet.public_subnet.*.id
}

output "private_subnet" {
    description = "Private subnet of Kojitechs"
  value = aws_subnet.private_subnet.*.id
}

output "db_subnet" {
    description = "DB subnet of Kojitechs"
  value = aws_subnet.db_subnet.*.id
}

output "public_rt" {
  value = aws_route_table.pub_RT.*.id
}

