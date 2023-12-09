resource "aws_iam_access_key" "access_key" {
  for_each = aws_iam_user.user
  user     = each.value.name
  lifecycle {
      create_before_destroy = true
  }
}