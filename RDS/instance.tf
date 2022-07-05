resource "aws_instance" "example" {
  ami = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
  #subnet
  subnet_id = aws_subnet.main-public-1.id
  #sec group
  vpc_security_group_ids = aws_security_group.example-instance.id
  #public SSH
  key_name = aws_key_pair.mykeypair.key_name
}
  
