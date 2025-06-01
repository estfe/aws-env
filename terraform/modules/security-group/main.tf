# Source: https://registry.terraform.io/modules/terraform-aws-modules/security-group/aws/latest

module "traefik_sg" {
  source  = "terraform-aws-modules/security-group/aws"

  name = "traefik_sg"
  vpc_id = var.vpc_id

  ingress_with_cidr_blocks = [
    {
        from_port: 80
        to_port: 80
        protocol = "tcp"
        cidr_blocks = "0.0.0.0/0"
    },
  ]

  egress_with_cidr_blocks = [
    {
        from_port = 0
        to_port     = 0
        protocol = "tcp"
        cidr_blocks = "0.0.0.0/0"
    }
  ]
}
