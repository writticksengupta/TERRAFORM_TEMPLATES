resource "aws_instance" "example" { 
  ami = var.ami.aws_region
  instance_type = "t2.micro"
  subnet_id = aws_subnet.main_public-1.id
  private_ip = "10.0.1.4" #private IP within the range of main-public-1
}
#to use a public IP address, youcan use EIP(elastic IP)
resource "aws_eip" "example-eip" {
  instance = aws_instance.example.id
  vpc = true
}
