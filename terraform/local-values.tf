# use of variables for different work environments dev/staging/prod 
locals {
  environment = var.environment
  name = "${local.environment}"
  common_tags = {
    environment = local.environment     // generic-variables.tf env. DEV 
  }
  eks_cluster_name = "${local.name}-${var.cluster_name}"  
} 