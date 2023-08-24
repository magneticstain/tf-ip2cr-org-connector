# tf-ip2cr-org-connector

Terraform plans used to create resources on a child account to support AWS Organizations usage in IP-2-CloudResource.

## Supported Features

* S3 backend
* State locking via DynamoDB table
* Modules ready to go, out-of-the-box

## Usage

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
bucket = "tf-bash-aws-tf-template"
key    = "terraform.tfstate"
region = "us-east-1"

dynamodb_table = "tf-bash-aws-tf-template"
```

### Set TF Vars

Generate a `terraform.tfvars` file and fill in the variables as approriate.

TODO: add tf vars file template for your project as needed

Example:

```hcl
ami_id = "ami-053b0d53c279acc90"  # Ubuntu Server 22.04 LTS
key_pair_name = "default"
subnets = ["subnet-123456789", "subnet-987654321"]
vpc = "vpc-12345abcde"
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
