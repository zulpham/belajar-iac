data "aws_iam_policy" "s3_ro" {
  name = "AmazonS3ReadOnlyAccess"
}

resource "aws_iam_user" "staff_lab" {
  name = "staff-lab"
}

resource "aws_iam_user_group_membership" "staff_lab" {
  groups = [aws_iam_group.group_lab.name]
  user = aws_iam_user.staff_lab.name
}

resource "aws_iam_group" "group_lab" {
  name = "group-lab"
}

resource "aws_iam_group_policy_attachment" "group_lab_s3_ro" {
  group      = aws_iam_group.group_lab.name
  policy_arn = data.aws_iam_policy.s3_ro.arn
}
