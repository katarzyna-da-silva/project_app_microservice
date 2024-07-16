# Create Elastic IP for ec2_publique ec2-instance.tf

resource "aws_eip" "bastion_eip" {
  depends_on = [ module.ec2_public, module.vpc ]
  instance = module.ec2_public.id
  domain = "vpc" // elastic id use for context vpc 
  tags = local.common_tags
}
