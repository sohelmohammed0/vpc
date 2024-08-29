resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "my-vpc"
  }
}

locals {
  # Calculate subnet CIDRs automatically if not provided
  calculated_cidr_blocks = length(var.subnet_cidr_blocks) == 0 ? [
    for i in range(length(var.subnet_names)) : cidrsubnet(var.vpc_cidr, 8, i)
  ] : var.subnet_cidr_blocks
}

resource "aws_subnet" "this" {
  count = length(var.subnet_names)

  vpc_id     = aws_vpc.this.id
  cidr_block = local.calculated_cidr_blocks[count.index]

  #   availability_zone = element(var.availability_zones, count.index)

  tags = {
    Name = element(var.subnet_names, count.index)
  }
}

