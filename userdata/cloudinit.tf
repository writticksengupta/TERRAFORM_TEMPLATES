data "template_file" "init-script" {
  template = "${file("scripts/init.cfg")}"
  vars {
    REGION = us-east-2
  }
}
data "template_file" "shell-script" {
  template = "${file("scripts/volume.sh)}"
  vars{
  DEVICE = var.instance_device_name
  }
  }
  gzip = false
  base64_encode = false
  part{
  filename = "init.cfg"
  content _type = "text/cloud-config"
  content = data.template_file.init-script.rendered
  }
  part { 
  content_type = "text/x-shellscript"
  content = data.template_file.shell-script.rendered
  }
  }
