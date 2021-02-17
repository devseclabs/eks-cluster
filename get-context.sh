#!/bin/bash

# AWS-CLI login
# must be configure aws credentials/ profile ~/.aws/credentials
#aws configure
# AWS eks get kubeconfig 
profile_name=$1
aws eks update-kubeconfig --name nvlabs-eks --profile $profile_name

#https://github.com/terraform-aws-modules/terraform-aws-eks/blob/master/examples/basic/main.tf
#https://docs.aws.amazon.com/eks/latest/userguide/load-balancing.html
#aws elb delete-load-balancer --load-balancer-name my-load-balancer