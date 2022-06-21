variable "access_key" {}
  variable "secret_key" {}
variable "region" {
    default = "us-east-2"
}
variable "ami" {
    default = {
        us-east-1 = "ami-0b0ea68c435eb488d"
        us-east-2 = "ami-05803413c51f242b7"
    }
}
variable "path_to_private_key" {
    default = "mykey"
}
variable "path_to_public_key" {
    default = "mykey.pub"
}
variable "instance_username" {
    default = "ubuntu"
}
