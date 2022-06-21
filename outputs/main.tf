provider "aws" {
    region = "us-east-2"
}
resource "aws_instance" "ec2" {
    ami = "ami-05803413c51f242b7"
    instance_type = "t2.micro"
    #store private ip of aws ince ec2 in private_ip.txt file locally
    provisioner "local-exec" {
        command = "echo ${aws_instance.ec2.private_ip} >> private_ip.txt"
    }
}
output "ip" {
    value = "${aws_instance.ec2.public_ip}"
}
