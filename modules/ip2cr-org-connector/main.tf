# Generate all cloud resources needed to support IP2CR access from org parent accounts

#######################
# IAM
#######################
## IP2CR cross-account role
### Role
resource "aws_iam_role" "ip2cr-xaccount-role" {
  name = var.ip2cr_xaccount_name

  assume_role_policy = var.ip2cr_xaccount_assume_role_policy
}

resource "aws_iam_role_policy" "ip2cr-xaccount-role-policy" {
  name = "${var.ip2cr_xaccount_name}-policy"
  role = aws_iam_role.ip2cr-xaccount-role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid      = ""
        Action   = [
          "cloudfront:ListDistributions",
          "ec2:DescribeInstances",
          "elasticloadbalancing:DescribeLoadBalancers"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}
