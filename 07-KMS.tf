resource "aws_kms_key" "iam_key" {
  description = "KMS key for encrypting IAM credentials"
  enable_key_rotation = true 
}


resource "aws_kms_ciphertext" "encrypted_secrets" {
  for_each = aws_iam_access_key.access_key
  key_id   = aws_kms_key.iam_key.key_id
  plaintext = each.value.secret 
}