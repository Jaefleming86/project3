resource "aws_iam_user" "user" {
  for_each = toset(var.users)
  name     = each.value
}

resource "aws_iam_user_login_profile" "user_login" {
  for_each = aws_iam_user.user
  user     = each.value.name
  pgp_key  = filebase64("${path.module}/public.asc.gpg")
}
