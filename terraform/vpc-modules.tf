# AWS Availability Zones Datasource
data "aws_availability_zones" "available" {
}

# Create VPC Terraform Module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"  
  version = "5.4.0"  
  
  # VPC Basic Details
  name = local.eks_cluster_name
  cidr = var.vpc_cidr_block
  azs             = data.aws_availability_zones.available.names
  public_subnets  = var.vpc_public_subnets
  private_subnets = var.vpc_private_subnets
  
  # NAT Gateways - Outbound Communication
  enable_nat_gateway = var.vpc_enable_nat_gateway 
  enable_dns_support   = true
  enable_dns_hostnames   = true

  tags = {
    "kubernetes.io/cluster/${local.eks_cluster_name}" = "shared"
  }

 # Instances launched into the Public subnet should be assigned a public IP address.
  map_public_ip_on_launch = true
}
#  private_subnet_tags = {
 #   Type = "private-subnets"
  #  "kubernetes.io/role/internal-elb" = 1"   
   # "kubernetes.io/cluster/${local.eks_cluster_name}" = "shared"    
 # }
 
