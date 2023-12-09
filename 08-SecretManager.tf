resource "aws_secretsmanager_secret" "test" {
  name            = "my_secret_name"
  kms_key_id      = aws_kms_key.iam_key.key_id  
}


resource "aws_secretsmanager_secret_version" "test" {
  secret_id     = aws_secretsmanager_secret.test.id
  secret_string = jsonencode({for k, v in aws_iam_access_key.access_key : k => {"AccessKey" = v.id, "SecretAccessKey" = v.secret}})
}

