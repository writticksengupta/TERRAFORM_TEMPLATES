#create a role and instance profile for instance
resource "aws_iam_role" "s3-mybucket-role" {
   name = "s3-mybucket-role"
   assume_role_policy=<<EOF
   {
     "version":2012-10-17",
     "statement":[
     {
     "Action":"sts:AssumeRole",
     "Principal":{
     "Service":"ec2.amazonaws.com"
     }
     "Effect":"Allow",
     "Sid":""
     }
     ]
     }
     EOF
     }
     resource "aws_iam_instance_profile" "s3-mybucket-role-instanceprofile"{
     name = "s3-mybucket-role"
     roles = aws_iam_role.s3-mybucket-role.name
     }
