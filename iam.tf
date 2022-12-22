
resource "aws_iam_role" "hashidog" {
  name = "hashidog_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "hashidog" {
  name = "hashidog_profile"
  role = aws_iam_role.hashidog.name
}

### testing role drift

resource "aws_iam_role" "driftrole1" {
  name = "driftrole1"
  tags = {
    hc-service-uri = "app.terraform.io/argocorp/driftrole1"
  }
  max_session_duration = 43200
  assume_role_policy   = data.aws_iam_policy_document.driftrole1-sts.json
}

data "aws_iam_policy_document" "driftrole1-sts" {
  statement {
    actions = [
      "sts:AssumeRole",
      "sts:SetSourceIdentity",
      "sts:TagSession"
    ]
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::397512762488:user/doormatServiceUser"]
    }
  }
}

resource "aws_iam_policy" "driftrole1" {
  name        = "driftrole1"
  description = "A test policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:*",
        "iam:*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "driftrole1" {
  role       = aws_iam_role.driftrole1.name
  policy_arn = aws_iam_policy.driftrole1.arn
}
