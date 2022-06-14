resource "aws_instance" "ec2" {
  ami           = lookup(var.AMIS, var.AWS_REGION)
  instance_type = "t2.micro"
  key_name = "abc"
}

