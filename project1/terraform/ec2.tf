resource "aws_security_group" "security_group" {
    vpc_id = "${aws_vpc.vpc.id}"
    
    ingress{
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        from_port = 22
        to_port =  22
    }
    ingress {
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        from_port = 80
        to_port = 80
    }
    ingress {
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        from_port = 443
        to_port = 443
    #-1 for all protocol
    }
    egress {
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
        from_port = 0
        to_port = 0
    }
  tags = {
    Name = "ec2-private-sg"
  }
}

#output "aws_security_gr_id" {
    #value = "${aws_security_group.security_group.id}"
  
#}
resource "aws_instance" "public_instance" {
  ami           = lookup(var.AMIS, var.AWS_REGION)
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.public_subnet.id}"
  key_name = "abc"
  #need one instance
  count = 1
  vpc_security_group_ids = ["${aws_security_group.security_group.id}"]
  associate_public_ip_address = true
  
}
resource "aws_instance" "private_instance" {
  ami           = lookup(var.AMIS, var.AWS_REGION)
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.private_subnet.id}"
  key_name = "abc"
  #need one instance
  count = 1
  vpc_security_group_ids = ["${aws_security_group.security_group.id}"]
  associate_public_ip_address = false
}