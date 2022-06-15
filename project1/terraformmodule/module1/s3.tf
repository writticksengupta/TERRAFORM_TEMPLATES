resource "aws_s3_bucket" "bucket1" {
    bucket = "writticks3backupbucket1"
    acl = "private"
 # As my state files are going to be stored in s3 bucket, I chose to keep the bucket private

    versioning {
      enabled = true
    }

    tags = { 
       Name = "state backup"
    }
  
}
