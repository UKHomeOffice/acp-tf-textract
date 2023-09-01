output "access_key" {
  description = "IAM User access key"
  value       = aws_iam_access_key.textract_iam_user_access_key.id
}

output "encrypted_secret" {
  description = "IAM User secret encrypted with provided gpg key to be supplied back to tenant (owner of gpg key)"
  value       = aws_iam_access_key.textract_iam_user_access_key.encrypted_secret
}