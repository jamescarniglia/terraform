resource "aws_iam_user" "store" {
  name = "store-${var.pop}-${var.region}"
  path = "/"
  tags = {
    tag-key = "store-${var.pop}-${var.region}"
  }
}

resource "aws_iam_access_key" "store" {
  user = "${aws_iam_user.store.name}"
}

resource "aws_iam_user_policy" "store" {
  name = "${aws_iam_user.store.name}-bucket"
  user = "${aws_iam_user.store.name}"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "s3:PutAccountPublicAccessBlock",
                "s3:GetAccountPublicAccessBlock",
                "s3:ListAllMyBuckets",
                "s3:HeadBucket"
            ],
            "Resource": "*"
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": "s3:*",
            "Resource": [
                "arn:aws:s3:::*/*",
                "arn:aws:s3:::${aws_iam_user.store.name}"
            ]
        }
    ]
}
EOF
}
