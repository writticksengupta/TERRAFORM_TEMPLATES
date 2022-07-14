resource "aws_iam_group" "administrators"{
  name = "administrators"
}
resource "aws_iam_group_policy" "my_developer_policy"{
  name = "my_administrators_policy"
  group = aws_iam_group.administrators.id
  policy = <<EOF
  {
    "version":"2012-10-17",
    "statement":[
      {
        "effect":"allow",
        "action":"*",
        "resource":"*"
      }
      ]
  }
  EOF
}
