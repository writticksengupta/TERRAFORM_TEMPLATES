terraform {
  backend "s3" {
    bucket = "writticks3backupbucket1"
    key = "writtick/project/terraform.tfstate"
    region = "us-east-2"
  }
}
