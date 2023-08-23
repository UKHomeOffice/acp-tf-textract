variable "environment" {
  description = "The environment the S3 is running in i.e. dev, prod etc"
}

variable "gpg_key" {
  description = "Base64 encoded string of requestors gpg key. Final AWS access key will be encoded with this"
}

variable "textract_iam_user" {
  description = "Name to be used to create the user for Textract API access"
}

variable "iam_user_policy_name" {
  description = "Name of the policy to be attached to user"
}

variable "tags" {
  description = "A dictionary of any additional tags required"
  default     = {}
}