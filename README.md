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
## Outputs

| Name | Description |
|------|-------------|
| this\_security\_group\_description | The description of the security group |
| this\_security\_group\_id | The ID of the security group |
| this\_security\_group\_name | The name of the security group |
| this\_security\_group\_owner\_id | The owner ID |
| this\_security\_group\_vpc\_id | The VPC ID |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->


## Todo

Kops deregistration script not working as expected yet. Still need run ```kops delete cluster ``` to purge

Build Terraform code to build network infra. Currently leverging default or preprovisioned infra





