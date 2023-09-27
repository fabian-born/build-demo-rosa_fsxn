output "oidc_config_id" {
  value = module.oidc_config.id
}

output "oidc_endpoint_url" {
  value = module.oidc_config.oidc_endpoint_url
}

output "thumbprint" {
  value = module.oidc_config.thumbprint
}

output "cluster_id" {
  value = rhcs_cluster_rosa_classic.rosa_sts_cluster.id
}

output "cluster_info" {
  value = rhcs_cluster_rosa_classic.rosa_sts_cluster
}

### AWS Outputs
# output "aws_fsxn_subnet_private" {   value = data.aws_subnet.rosa_private }
# output "aws_fsxn_subnet_public" {   value = data.aws_subnet.rosa_public }
# output "aws_all_rosa_subnets" { value = data.aws_subnets.rosasubnets }
# output "data_rosa_vpcs" { value = data.aws_vpcs.rosavpcs.ids }

### FSxN Outputs
# output "fsxn" { value = var.subnet_ids }
