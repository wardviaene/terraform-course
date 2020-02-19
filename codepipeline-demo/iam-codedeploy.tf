resource "aws_iam_role" "demo-codedeploy" {
  name = "demo-codedeploy"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "codedeploy.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF

}

data "aws_iam_policy_document" "demo-codedeploy-role-policy" {
  statement {
    effect = "Allow"
    actions = [
      "ecs:*",
    ]
    resources = [
      "*",
    ]
  }
}

resource "aws_iam_role_policy" "demo-codedeploy" {
  name = "codedeploy-policy"
  role = aws_iam_role.demo-codedeploy.id
  policy = data.aws_iam_policy_document.demo-codedeploy-role-policy.json
}


