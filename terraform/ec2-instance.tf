# EC2 Instance Terraform Module
# Bastion Host - EC2 Instance that will be created in VPC Public Subnet
module "ec2_public" {
  source  = "terraform-aws-modules/ec2-instance/aws" 
  version = "5.5.0"      
# name ec2, instance type in ami-datasource.tf
  name                   = "${local.name}-BastionHost"
  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  subnet_id              = module.vpc.public_subnets[0] // first subnet in vpc 
  vpc_security_group_ids = [module.public_bastion_sg.security_group_id] // public_bastion_sg ec-2-securitygroups.tf
  tags = local.common_tags // add environment
}

// creation instance / source / version / fichier : local values pour variables /  keypair ssh // definition pour vpc 