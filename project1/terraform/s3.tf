resource "aws_s3_bucket" "bucket" {
    bucket = "writticks3backupbucket"
    acl = "private"

    versioning {
      enabled = true
    }

    tags = { 
       Name = "state backup"
    }
  
}

