resource "aws_subnet" "virginia-subnet-1" {
  vpc_id = aws_vpc.virginia-vpc.id
  cidr_block = "192.168.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = var.az_1a
}

resource "aws_subnet" "virginia-subnet-2" {
  vpc_id = aws_vpc.virginia-vpc.id
  cidr_block = "192.168.2.0/24"
  map_public_ip_on_launch = true
  availability_zone = var.az_1b
  
}

