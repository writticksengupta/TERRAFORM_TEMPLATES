#under under any .tf file like main.tf,etc.
resources "aws_instance" "example" {
  ami = ....
  ...
user_data = data.template_cloudinit_config.cloudinit-example.rendered
}
