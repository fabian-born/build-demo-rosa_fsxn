provider "aws" {
  profile = "default"
  region  = var.aws_region
}

resource "aws_fsx_ontap_file_system" "fsxn" {
  storage_capacity                = var.fs_capacity
  subnet_ids                      = var.subnet_ids
  deployment_type                 = var.deployment_type
  throughput_capacity             = var.fs_throughput
  preferred_subnet_id             = var.subnet_ids[0]
  # preferred_subnet_id             = var.subnet_ids[0]
  automatic_backup_retention_days = var.automatic_backup_retention
  fsx_admin_password              = var.fsxadmin_password
  tags = {
    Name      = var.fsxn_name
    Terraform = "True"
    Owner     = var.fsxn_owner
  }

}

resource "aws_fsx_ontap_storage_virtual_machine" "svm_demo" {
  file_system_id = aws_fsx_ontap_file_system.fsxn.id
  name           = var.svm_name

}

