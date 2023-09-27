resource "rhcs_identity_provider" "htpasswd_idp" {
  cluster = rhcs_cluster_rosa_classic.rosa_sts_cluster.id
  name    = "${var.cluster_name}_htpasswd"
  htpasswd = {
    users = var.htpasswd_users
  }
}