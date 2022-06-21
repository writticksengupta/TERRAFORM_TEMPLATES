resource "aws_key_pair" "mykey" {
    key_name = "mykey"
    public_key = "${file("${var.path_to_public_key}")}"
}

resource "aws_instance" "ec2" {
    ami = "${lookup( var.ami,var.region)}"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.mykey.key_name}"
provisioner "file" {
    source = "script.sh"
    destination = "/tmp/script.sh"
}

provisioner "remote-exec" {
    inline = [
        "chmod +x /tmp/script.sh",
        "sudo /tmp/script.sh"
    ]
}
connection {
    user = "${var.instance_username}"
    host = self.public_ip
    private_key = "${file("${var.path_to_private_key}")}"
}
}

