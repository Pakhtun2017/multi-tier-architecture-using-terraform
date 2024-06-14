resource "aws_subnet" "web" {
  count             = length(var.web_cidr_blocks)
  vpc_id            = var.vpc_id
  cidr_block        = var.web_cidr_blocks[count.index]
  availability_zone = var.azs[count.index]
  map_public_ip_on_launch = true
  
  tags = merge(
    {
      Name = var.web_subnet_names[count.index]
    },
    var.tags
  )
}

resource "aws_subnet" "app" {
  count             = length(var.app_cidr_blocks)
  vpc_id            = var.vpc_id
  cidr_block        = var.app_cidr_blocks[count.index]
  availability_zone = var.azs[count.index]
  
  tags = merge(
    {
      Name = var.app_subnet_names[count.index]
    },
    var.tags
  )
}

resource "aws_subnet" "db" {
  count             = length(var.db_cidr_blocks)
  vpc_id            = var.vpc_id
  cidr_block        = var.db_cidr_blocks[count.index]
  availability_zone = var.azs[count.index]
  
  tags = merge(
    {
      Name = var.db_subnet_names[count.index]
    },
    var.tags
  )
}
