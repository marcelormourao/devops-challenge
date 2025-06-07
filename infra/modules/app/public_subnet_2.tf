resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "192.168.5.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-west-2d"

  tags = {
    Name = "${var.name}-public-subnet-2",
  }
}

resource "aws_route_table_association" "rt_association_2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.route_table.id
}
