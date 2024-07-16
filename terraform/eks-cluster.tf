# creating cluster in aws

resource "aws_eks_cluster" "eks_cluster" {
  name = "${local.name}-${var.cluster_name}"       #name cluster 
  role_arn = aws_iam_role.eks_master_role.arn  # access for cluster arn identite in aws
 
# adding public and private networks defined in vpc files
  vpc_config {
    subnet_ids = module.vpc.public_subnets
    endpoint_private_access = var.cluster_endpoint_private_access
    endpoint_public_access  = var.cluster_endpoint_public_access
    public_access_cidrs     = var.cluster_endpoint_public_access_cidrs    
  }
# adding ip via cidr avec vpc files
  kubernetes_network_config {
    service_ipv4_cidr = var.cluster_service_ipv4_cidr
  }

  # adding additions to the control that manages the cluster, in order to monitor how the cluster works
  enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]

# starting the cluster depends on these policies:
# cluster management policy and resource management, security groups
  depends_on = [
    aws_iam_role_policy_attachment.eks-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.eks-AmazonEKSVPCResourceController,
  ]
}
