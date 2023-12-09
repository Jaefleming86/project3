output "aws_iam_group_arns" {
  value = { for k, v in aws_iam_group.group : k => v.arn }
}

output "aws_iam_user_arns" {
  value = { for k, v in aws_iam_user.user : k => v.arn }
}

output "aws_iam_user_ids" {
  value = { for k, v in aws_iam_user.user : k => v.id }
}

output "aws_iam_group_descriptions" {
  value = var.iam_groups
}

output "aws_iam_group_policy_ids" {
  value = { for k, v in aws_iam_group_policy.group_specific_policy : k => v.id }
}

output "aws_iam_group_policy_groups" {
  value = { for k, v in aws_iam_group_policy.group_specific_policy : k => v.group }
}

output "group_membership_details" {
  value = { for k, v in aws_iam_group_membership.group_membership : k => { "group" = v.group, "users" = v.users } }
}

output "kms_key_arn" {
  value = aws_kms_key.iam_key.arn
  description = "The ARN of the KMS key used for encryption."
}

output "secrets_manager_secret_arn" {
  value = aws_secretsmanager_secret.test.arn
  description = "The ARN of the Secrets Manager secret."
}

output "secrets_manager_secret_name" {
  value = aws_secretsmanager_secret.test.name
  description = "The name of the Secrets Manager secret."
}

output "iam_user_login_profiles" {
  value = { for u in aws_iam_user.user : u.name => lookup(aws_iam_user_login_profile.user_login[u.name], "encrypted_password", null) }
  description = "Encrypted login profile passwords for IAM users."
}

