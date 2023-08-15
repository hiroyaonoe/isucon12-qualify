resource "aws_vpc" "vpc" {
  cidr_block           = "192.168.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "terraform-isucon11q"
  }
}

resource "aws_subnet" "subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "192.168.0.0/24"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "terraform-isucon11q"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "terraform-isucon11q"
  }
}

resource "aws_route_table" "rtb" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "terraform-isucon11q"
  }
}

resource "aws_route" "public" {
  route_table_id         = aws_route_table.rtb.id
  gateway_id             = aws_internet_gateway.igw.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table_association" "rt_assoc" {
  subnet_id      = aws_subnet.subnet.id
  route_table_id = aws_route_table.rtb.id
}
