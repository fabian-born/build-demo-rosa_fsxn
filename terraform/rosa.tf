#
# Copyright (c) 2023 Red Hat, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#



# Create managed OIDC config
module "oidc_config" {
  token                = var.token
  url                  = var.url
  source               = "../oidc_provider"
  managed              = true
  operator_role_prefix = var.operator_role_prefix
  account_role_prefix  = var.account_role_prefix
  tags                 = var.tags
  path                 = var.path
  aws_access_key       = var.aws_access_key
  aws_secret_key       = var.aws_secret_key
}

locals {
  path = coalesce(var.path, "/")
  sts_roles = {
    role_arn         = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role${local.path}${var.account_role_prefix}-Installer-Role",
    support_role_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role${local.path}${var.account_role_prefix}-Support-Role",
    instance_iam_roles = {
      master_role_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role${local.path}${var.account_role_prefix}-ControlPlane-Role",
      worker_role_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role${local.path}${var.account_role_prefix}-Worker-Role"
    },
    operator_role_prefix = var.operator_role_prefix,
    oidc_config_id       = module.oidc_config.id
  }
}

data "aws_caller_identity" "current" {
}

resource "rhcs_cluster_rosa_classic" "rosa_sts_cluster" {
  name                = var.cluster_name
  cloud_region        = var.cloud_region
  aws_account_id      = data.aws_caller_identity.current.account_id
  availability_zones  = var.availability_zones
  replicas            = var.replicas
  autoscaling_enabled = var.autoscaling_enabled
  min_replicas        = var.min_replicas
  max_replicas        = var.max_replicas
  version             = var.openshift_version
  properties = {
    rosa_creator_arn = data.aws_caller_identity.current.arn
  }
  sts = local.sts_roles
}

resource "rhcs_cluster_wait" "rosa_cluster" {
  cluster = rhcs_cluster_rosa_classic.rosa_sts_cluster.id
  # timeout in minutes
  timeout = 60
}


module "fsxn_config" {
  # depends_on = [ rhcs_cluster_rosa_classic.rosa_sts_cluster]
  source                      = "./fsxn"
  aws_region                  = var.cloud_region
  deployment_type             = var.deployment_type
  fs_capacity                 = var.fs_capacity
  fs_throughput               = var.fs_throughput
  subnet_ids                  = ["${data.aws_subnet.rosa_private.id}"]
  prefix	                    = var.prefix
  fsxn_name                   = var.fsxn_name
  fsxn_owner                  = var.fsxn_owner
  automatic_backup_retention  = var.automatic_backup_retention
  svm_name                    = var.svm_name
  netbios_name                = var.netbios_name
  dns_ips                     = var.dns_ips
  domain_name                 = var.domain_name
  fsxadmin_password           = var.fsxadmin_password
  aws_access_key              = var.aws_access_key
  aws_secret_key              = var.aws_secret_key

}
