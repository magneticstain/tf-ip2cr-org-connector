ip2cr_xaccount_name = "ip2cr-xaccount-connector"
ip2cr_xaccount_assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": [
                    "arn:aws:iam::138277128026:root",
                    "arn:aws:iam::509915386432:root"
                ]
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
EOF
