resource "aws_vpc" "virginia-vpc" {

  cidr_block = "192.168.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "my-virginia-vpc"
  }

}


resource "aws_internet_gateway" "main-gateway" {
    vpc_id = aws_vpc.virginia-vpc.id
    tags = {
      Name = "virginia-gateway"
    }

}



resource "aws_route_table" "virginia-main-table" {

    vpc_id = aws_vpc.virginia-vpc.id


    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.main-gateway.id
   }

   tags = {
     Name = "virginia-rtb"
   }



}



resource "aws_main_route_table_association" "rtb-vpc-association" {
  vpc_id         = aws_vpc.virginia-vpc.id
  route_table_id = aws_route_table.virginia-main-table.id
}
#
#
# resource "aws_route_table_association" "rtb-subnet-1-association" {
#   subnet_id      = aws_subnet.virginia-subnet-1.id
#   route_table_id = aws_route_table.virginia-main-table.id
# }
#
# resource "aws_route_table_association" "rtb-subnet-2-association" {
#   subnet_id      = aws_subnet.virginia-subnet-2.id
#   route_table_id = aws_route_table.virginia-main-table.id
# }
