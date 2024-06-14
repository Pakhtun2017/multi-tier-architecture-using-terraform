resource "aws_eip" "this" {
    domain = "vpc"
}

resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.this.id
  subnet_id = var.public_subnet_id
  connectivity_type = "public"
  tags = merge(
    {
      Name = var.name
    },
    var.tags
  )
  depends_on = [ var.internet_gateway_id ]
}