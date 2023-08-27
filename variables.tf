variable "ip2cr_xaccount_name" {
    type = string
    description = "Name to use for IP2CR cross-account role"
    default = ""
    nullable = false
}

variable "ip2cr_xaccount_assume_role_policy" {
    type = string
    description = "IAM policy to use as trust policy for IP2CR connector roles"
    default = ""
    nullable = false
}