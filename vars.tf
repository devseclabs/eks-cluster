# VARS
#general
variable "profile" {
    default = "default"
}
variable "region" {
    default = "us-west-1"
}
variable "env_name" {
    default = "nvlabs"
}
variable "zones" {
    default = ["us-west-1b", "us-west-1c"]
}
variable "machine_type" {
    default = "m4.large"
}
variable "asg_max" {
    default = "1"
}

# Network
variable  "vpc_net" {
    default = "10.0.0.0/16"
}
variable "vpc_private_subnets" {
    default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}
variable "vpc_public_subnets" {
    default = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}