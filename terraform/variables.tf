variable "aws_region" {
  description = "Region in AWS"
  type        = string
  default     = "eu-central-1"
}

variable "eks_clustername" {
  description = "EKS Cluster Name"
  type        = string
  default     = "ekscluster"
}

variable "subnet_ids" {
  description = "Array of subnet ids"
  type        = list(string)
}

variable "prefix" {}
variable "fsxn_name" {
  description = "fsxn name"
  type = string
}
variable "fsxn_owner" {}

variable "deployment_type" {}

variable "fs_capacity" {}

variable "fs_throughput" {}

variable "aws_access_key" {}
variable "aws_secret_key" {}

variable "automatic_backup_retention" {
  description = "Automatic backup retention for filesystem in days"
  type        = number
}

variable "fsxadmin_password" {
  description = "ONTAP administrative password fsxadmin user"
  type        = string
  sensitive   = true
}

variable "svm_name" {
  description = "Name of svm"
  type        = string
}

variable "netbios_name" {
  description = "Name of cifs machine account"
  type        = string
}


variable "dns_ips" {
  description = "Array of IPs for nameservers"
  type        = list(string)
}

variable "domain_name" {
  description = "Name of cifs domain to join"
  type        = string
  default = "addomain"
}

variable "ad_username" {
  description = "Active Directory administrator username"
  type        = string
  sensitive   = true
  default ="admin"
}

variable "ad_password" {
  description = "Active Directory administrator password"
  type        = string
  sensitive   = true
  default = "userpassword"
}



#### RedHat Configuration / Variables

variable "token" {
  type      = string
  sensitive = true
}

variable "operator_role_prefix" {
  type = string
}

variable "url" {
  type        = string
  description = "Provide OCM environment by setting a value to url"
  default     = "https://api.openshift.com"
}

variable "account_role_prefix" {
  type = string
}

variable "cluster_name" {
  type    = string
  default = "my-cluster"
}

variable "cloud_region" {
  type    = string
  default = "us-east-2"
}

variable "availability_zones" {
  type    = list(string)
  default = ["us-east-2a"]
}
variable "path" {
  description = "(Optional) The arn path for the account/operator roles as well as their policies."
  type        = string
  default     = null
}

variable "tags" {
  description = "List of AWS resource tags to apply."
  type        = map(string)
  default     = null
}

variable "openshift_version" {
  description = "Desired version of OpenShift for the cluster, for example '4.1.0'. If version is greater than the currently running version, an upgrade will be scheduled."
  type        = string
  default     = "4.13.0"
}

variable "replicas" {
  description = "The amount of the machine created in this machine pool."
  type        = number
  default     = null
}

variable "autoscaling_enabled" {
  description = "Enables autoscaling. This variable requires you to set a maximum and minimum replicas range using the `max_replicas` and `min_replicas` variables."
  type        = string
  default     = "false"
}

variable "min_replicas" {
  description = "The minimum number of replicas for autoscaling."
  type        = number
  default     = null
}

variable "max_replicas" {
  description = "The maximum number of replicas not exceeded by the autoscaling functionality."
  type        = number
  default     = null
}

variable "htpasswd_users" {
  type = list(object({
    username = string
    password = string
  }))
  description = "htpasswd user list"
}