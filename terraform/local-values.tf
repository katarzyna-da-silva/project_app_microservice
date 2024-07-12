# Define Local Values in Terraform
locals {
  environment = var.environment
  name = "${local.environment}"
  common_tags = {
    environment = local.environment
  }
  eks_cluster_name = "${local.name}-${var.cluster_name}"  
} 