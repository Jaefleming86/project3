variable "iam_groups" {
  description = "Map of IAM group names and their descriptions"
  type        = map(string)
}

variable "users" {
  description = "List of IAM user names"
  type        = list(string)
}

variable "group_users" {
  description = "Map of IAM group names to lists of user names"
  type        = map(list(string))
}

variable "group_policies" {
  description = "Map of IAM group names to lists of policy actions"
  type        = map(list(string))
}


variable "mfa_enabled_groups" {
  description = "List of groups that require MFA"
  type        = list(string)
  default     = ["Revans_Rule", "Maglus_Rule"] 
}



