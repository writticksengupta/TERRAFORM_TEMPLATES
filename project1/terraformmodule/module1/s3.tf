resource "aws_s3_bucket" "bucket1" {
    bucket = "writticks3backupbucket1"
    acl = "private"

    versioning {
      enabled = true
    }

    tags = { 
       Name = "state backup"
    }
  
}