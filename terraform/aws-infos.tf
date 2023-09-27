

data "aws_vpcs" "rosavpcs" {
   filter {
    name   = "tag:Name"
    values = ["*${var.cluster_name}*"]
   }
   depends_on = [
	rhcs_cluster_rosa_classic.rosa_sts_cluster,
	rhcs_cluster_wait.rosa_cluster
   ]
}


data "aws_subnets" "rosasubnets" {
  tags = {
     red-hat-clustertype = "rosa"
  }
  filter {
    name   = "tag:Name"
    values = ["*${var.cluster_name}*"]
  }
   depends_on = [
        rhcs_cluster_rosa_classic.rosa_sts_cluster,
	rhcs_cluster_wait.rosa_cluster
   ]
}


data "aws_subnet" "rosa_private" {
  filter { 
    name   = "tag:Name" 
    values = ["*private*"]  
  }
  depends_on = [ rhcs_cluster_rosa_classic.rosa_sts_cluster,  rhcs_cluster_wait.rosa_cluster]
}

data "aws_subnet" "rosa_public" {
  filter {
    name   = "tag:Name"
    values = ["*public*"]
  }
  depends_on = [ rhcs_cluster_rosa_classic.rosa_sts_cluster, rhcs_cluster_wait.rosa_cluster ]
}
