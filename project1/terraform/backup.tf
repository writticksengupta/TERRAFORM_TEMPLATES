terraform {
  backend "s3" {
    bucket = "writticks3backupbucket"
    key = "writtick/project/terraform.tfstate"
    region = "us-east-2"
  }
}
