# acp-tf-textract terraform module

Terraform module used to create a user with access to the AWS Textract API Service.

Module usage:

    module "acp-tf-textract" {

        source = "git::https://github.com/UKHomeOffice/acp-tf-textract?ref=main"
        textract_iam_user = "fake-textract-username"
        iam_user_policy_name = "fake-textract-policy"
        // base64 encoded public gpg key for secret output 
        gpg_key = "LS0t...."
        environment = "${var.environment}"
        tags = {
          // any required tags
        }
     }

Provide as part of the Terraform a base64 encoded GPG string of the requestor.

The module will then output an encrypted secret key for only them to decrypt.

The AWS user and secret key can be used to programmatically access the API.