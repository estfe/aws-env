# Source: https://registry.terraform.io/modules/terraform-aws-modules/eks/aws/latest/submodules/aws-auth

module "auth" {
  source  = "terraform-aws-modules/eks/aws//modules/aws-auth"
  version = "~> 20.31.3"

  manage_aws_auth_configmap = true

  aws_auth_users = [
    {
      userarn  = var.git_user_arn 
      username = var.git_user
      groups   = ["system:masters"]
    }
  ]
}
