
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
  inline_policy {
    name   = "SampleRolePermissions"
    policy = data.aws_iam_policy_document.driftrole1.json
  }
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

# The following is just for completeness of the sample
data "aws_iam_policy_document" "driftrole1" {
  statement {
    actions   = ["ec2:*", "iam:*"]
    resources = ["*"]
  }
}