resource "aws_iam_group" "administrators"{
  name = "administrators"
}
resource "aws_iam_policy_attachment" "administrators-attach"{
  name = "administrators-attach"
  group = aws_iam_group.administrators.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
