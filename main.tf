/*
Module usage:
      module "textractuser" {
         source = "git::https://github.com/UKHomeOffice/acp-tf-textract?ref=main"
         textract_iam_user = "fake-textract-username"
         iam_user_policy_name = "fake-textract-policy"
         // base64 encoded public gpg key for secret output 
         gpg_key = "LS0t...."
         environment = var.environment
         tags = {
           // any required tags
        }
      }
*/

data "aws_iam_policy" "AmazonTextractFullAccess" {
  arn  = "arn:aws:iam::aws:policy/AmazonTextractFullAccess"
}

resource "aws_iam_user" "textract_iam_user" {
  name = var.textract_iam_user
  tags = merge(
    var.tags,
    {
      "Name" = format("%s-%s", var.environment, var.textract_iam_user)
    },
    {
      "Env" = var.environment
    }
  )
}

resource "aws_iam_policy_attachment" "textract_iam_user_policy_attachment" {
  name       = format("%s-%s-%s", var.environment, var.textract_iam_user, var.iam_user_policy_name)
  users      = [aws_iam_user.textract_iam_user.name]
  policy_arn = data.aws_iam_policy.AmazonTextractFullAccess
}

resource "aws_iam_access_key" "textract_iam_user_access_key" {
  user    = aws_iam_user.textract_iam_user.name
  pgp_key = var.gpg_key
}