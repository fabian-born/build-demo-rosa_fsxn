# Build a demo environment with ROSA and FSxN

### how to use it?

```terraform
### AWS Credentials
aws_access_key = "<your key>"
aws_secret_key = "<your sec key>"

#### RedHat RHCS
cluster_name            = "<your cluster name>"
token                   = "<your rhcs token>"
url                     = "https://api.openshift.com"
operator_role_prefix    = "ManagedOpenShift"
account_role_prefix     = "ManagedOpenShift"
cloud_region            = "<aws region>"
availability_zones      = ["<aws az>"]
path                    = "/"
tags                    = { <your tags>}
openshift_version       = "4.2x.x"
# replicas = 2
autoscaling_enabled     = true # fixed value
min_replicas            = 2
max_replicas            = 2

# P4$$w0rd!
htpasswd_users = [{ "username":"<your username>","password":"<your password>" }]

### FSxN Variables
aws_region                  = "<see cloud_region>"
deployment_type             = "SINGLE_AZ_1"
fs_capacity                 = 1024
fs_throughput               = 128
subnet_ids                  = ["<aws subnet ids>"]
prefix	                    = "prefix"
fsxn_name                  = "fsxn"
fsxn_owner                   = ""    ## FS name
automatic_backup_retention = 30
svm_name                   = "svm_fsxn"
netbios_name               = "svm_fsxn"
dns_ips                    = [""]
domain_name                = ""
fsxadmin_password      = "<fsxn password>"
```

