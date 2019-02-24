# kick off kops using Terraform

An exercise to cleanly create, use and dispose kops components using Terraform

Data sources are used to discover existing VPC resources (VPC and default security group).

## Usage

To run,  you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## The following  are required

| Name | Description |
|------|-------------|
| cluster\_dns\_zone | Your registered domain . Must have been created|
| cluster\_name | For exmaple  [ kopsup.shegoj.com ] |
| cluster\_state\_s3 | S3 bucket created to store cluster state. Must have been created |
| key\_id |Key to login into EC2 Toolbox node . Mode have been created |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->


## Todo

Kops deregistration script not working as expected yet. Still need run ```kops delete cluster ``` to purge

Build Terraform code to build network infra. Currently leverging default or preprovisioned infra





