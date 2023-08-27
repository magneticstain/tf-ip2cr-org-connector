# tf-ip2cr-org-connector

Terraform plans used to create resources on a child account to support AWS Organizations usage in IP-2-CloudResource.

## Supported Features

* S3 backend
* State locking via DynamoDB table
* Modules ready to go, out-of-the-box

## Usage

### Prepare Environment

The first step is to configure your environment right. First, you should set the profile you want to use (or however else you auth).

```bash
export AWS_PROFILE=profile-123
```

### Reconfigure Backend

If this is a new account, or you're switching over from running this plan on another account, you will also need to reconfigure the terraform backend.

```bash
terraform init -backend-config=./backend.tfvars -reconfigure
```

### Bootstrap the Prerequisite Resources

The plans use S3 as a backend and DynamoDB for state tracking. A script is included to easily generate the resources needed to support this.

```bash
./utils/generate_backend.sh
```

Open it in your favorite text editor and update the `PROJ_NAME` variable to the name of your project.

```bash
PROJ_NAME="<PROJECT_NAME>" ## !!! UPDATE ME !!!
```

Save and then run in your shell using the command above.

#### Update `backend.tfvars` File

Take the names of the S3 bucket and DynamoDB table from the backend generator script and use them to update `backend.tfvars`.

Example:

```hcl
bucket = "tf-ip2cr-org-connector"
key    = "terraform.tfstate"
region = "us-east-1"

dynamodb_table = "tf-ip2cr-org-connector"
```

### Set TF Vars

Generate a `terraform.tfvars` file and fill in the variables as approriate.

Example:

```hcl
ip2cr_xaccount_name = "ip2cr-xaccount-connector"
ip2cr_xaccount_assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "sts:AssumeRole",
            "Principal": {
                "Service": "ec2.amazonaws.com"
            }
        }
    ]
}
EOF
```

### Plan and Apply Plans

A Make file has been included to make running these plans easier. There is no need to initialize the environment, or any other prerequesite work, prior to running these commands.

#### Plan

```bash
make plan
```

#### Apply

```bash
make apply
```
