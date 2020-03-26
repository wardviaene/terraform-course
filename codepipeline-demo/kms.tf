#
# kms
#
data "aws_iam_policy_document" "demo-artifacts-kms-policy" {
  policy_id = "key-default-1"
  statement {
    sid    = "Enable IAM User Permissions"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
    }
    actions = [
      "kms:*",
    ]
    resources = [
      "*",
    ]
  }
}

resource "aws_kms_key" "demo-artifacts" {
  description = "kms key for demo artifacts"
  policy      = data.aws_iam_policy_document.demo-artifacts-kms-policy.json
}

resource "aws_kms_alias" "demo-artifacts" {
  name          = "alias/demo-artifacts"
  target_key_id = aws_kms_key.demo-artifacts.key_id
}


