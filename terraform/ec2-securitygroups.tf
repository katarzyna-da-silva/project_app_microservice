# AWS EC2 Security Group Terraform Module

# locates the module from the terraform-aws-modules repository
module "public_bastion_sg" {
  source  = "terraform-aws-modules/security-group/aws" 
  version = "5.1.0"  
# add name for module, desc, and add vpc
  name = "${local.name}-public-bastion-sg"
  description = "Security Group with SSH port open"
  vpc_id = module.vpc.vpc_id
  # Ingress Rules & CIDR Blocks   accepts incoming traffic via SSH port (22) for TCP.
  ingress_rules = ["ssh-tcp"]
  # Allows access to the SSH port from any IP address on the Internet (open access)
  ingress_cidr_blocks = ["0.0.0.0/0"]
  # allows you to get in and out from anywhere with any IP to connect to
  egress_rules = ["all-all"]
  tags = local.common_tags
}

# jump box - bastion host security practice,
# in public EC2 you can run private services to which no one has access