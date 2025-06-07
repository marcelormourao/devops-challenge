resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "192.168.2.0/24"
  map_public_ip_on_launch = false
  availability_zone       = "us-west-2d"

  tags = {
    Name = "${var.name}-private-subnet"
  }
}
