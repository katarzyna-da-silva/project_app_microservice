# using the region in which I operate
data "aws_availability_zones" "available" {
}

# creation vpc module, version 
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws" 
  version = "5.4.0"  
  
  # variables are created in variable.tf
  name = local.eks_cluster_name
  cidr = var.vpc_cidr_block
  azs             = data.aws_availability_zones.available.names
  public_subnets  = var.vpc_public_subnets
  private_subnets = var.vpc_private_subnets  

  # for database 
  database_subnets = var.vpc_database_subnets
  create_database_subnet_group = var.vpc_create_database_subnet_group
  create_database_subnet_route_table = var.vpc_create_database_subnet_route_table
  
  # NAT Gateways for prive subnet
  enable_nat_gateway = var.vpc_enable_nat_gateway 
  single_nat_gateway = var.vpc_single_nat_gateway

  # connection avec dns for vpc 
  enable_dns_hostnames = true
  enable_dns_support   = true

  // defines the work environment, see in local-values
  tags = local.common_tags
  vpc_tags = local.common_tags

  # adding tags for resource organization: public or private subnet can be used by ELB
  # used by a kubernetes resource with a given cluster name for various resources
  public_subnet_tags = {
    Type = "Public Subnets"
    "kubernetes.io/role/elb" = 1    
    "kubernetes.io/cluster/${local.eks_cluster_name}" = "shared"        
  }
  private_subnet_tags = {
    Type = "private-subnets"
    "kubernetes.io/role/internal-elb" = 1    
    "kubernetes.io/cluster/${local.eks_cluster_name}" = "shared"    
  }

  database_subnet_tags = {
    Type = "database-subnets"
  }
  # add a public IP address for each instance
  map_public_ip_on_launch = true
}