resource "aws_route_table" "public" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internet_gateway_id
  }

  tags = {
    Name = var.public_route_table_name
  }
}

resource "aws_route_table" "private" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = var.nat_gateway_id
  }

  tags = {
    Name = var.private_route_table_name
  }
}

resource "aws_route_table_association" "public_subnet1" {
  subnet_id      = var.public_subnet1_id  
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_subnet2" {
  subnet_id      = var.public_subnet2_id 
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private_subnet1" {
  subnet_id      = var.private_subnet1_id  
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_subnet2" {
  subnet_id      = var.private_subnet2_id 
  route_table_id = aws_route_table.private.id
}

