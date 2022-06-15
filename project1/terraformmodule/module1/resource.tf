resource "aws_vpc" "vpc" {
 cidr_block = "10.0.0.0/16"
 instance_tenancy = "default"
 tags = {
  Name = "project vpc"
 }
}
# (Optional) Used for NAT gateway and public ec2 instance
# resource "aws_subnet" "public_subnet" {
#   vpc_id = "${aws_vpc.vpc.id}"
#   cidr_block =  "10.0.1.0/24"
#   map_public_ip_on_launch = "true"
#   availability_zone = "us-east-2a"
#   tags = {
#     Name = "Public Subnet"
#   }
# }

resource "aws_subnet" "private_subnet" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-2a"
  map_public_ip_on_launch = false

  tags = {
    Name = "Private Subnet"
  }
}
# (Optional) For public ec2 instance and subnet
# resource "aws_internet_gateway" "igw" {
#   vpc_id = "${aws_vpc.vpc.id}"
#   tags = {
#     Name = "igw"
#   }
# }
# resource "aws_route_table" "public_rt" {
#   vpc_id = "${aws_vpc.vpc.id}"
#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = "${aws_internet_gateway.igw.id}"
#   }
#   tags = {
#     "Name" = "Public Route Table"
#   }
# }
#   resource "aws_route_table_association" "public" {
#     subnet_id = "${aws_subnet.public_subnet.id}"
#     route_table_id = "${aws_route_table.public_rt.id}"
# }
