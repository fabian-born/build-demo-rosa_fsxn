variable "aws_region" {
  description = "Region in AWS"
  type        = string
  default     = "eu-central-1"
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


