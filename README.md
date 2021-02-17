# Terraform - EKS Cluster Deployment

## Versions

| Name | Version |
|------|---------|
| terraform | >= 0.13.0|

## Inputs - terraform.tfvars

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| machine_type | by default m4.large | `string` | `{}` | no |
| asg_max | by default 1 - auto scaling group parameter | `int` | `{}` | no |
| region | by default us-west-1 | `string` | `{}` | no |
| zones | by default ["us-west-1a", "us-west-1c"] | `list` | `{}` | no |

## Rename Vars file  to terraform.tfvars
```
profile             = "my-profile"
machine_type        = "m4.large"
region              = "us-west-1"
zones               = ["us-west-1a", "us-west-1c"]
asg_max             =  2
```
## Deploy and Manage your deployment using terraform:
    - init your plugins                 ```terraform init```
    - plan your deployment              ```terraform plan```
    - apply the changes in your cluster ```terraform apply```

## Get the cluster context:
    - execute the script ans pass the profile as parameter ```./get-context.sh my-profile```


### Clean Up
- destroy your deployment: ```terraform destroy```
