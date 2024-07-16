# Create Elastic IP
# Resource - depends_on Meta-Argument
resource "aws_eip" "bastion_eip" {
  depends_on = [ module.ec2_public, module.vpc ]
  instance = module.ec2_public.id
  #vpc      = true
  domain = "vpc"
  tags = local.common_tags
}

// for elastic ip 
// creation ressources pour ec2 public, + vpc pou ip elastique 