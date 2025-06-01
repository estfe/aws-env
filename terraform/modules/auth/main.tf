# Source: https://registry.terraform.io/modules/terraform-aws-modules/eks/aws/latest/submodules/aws-auth

module "auth" {
  source  = "terraform-aws-modules/eks/aws//modules/aws-auth"
  version = "~> 20.0"

  manage_aws_auth_configmap = true

  aws_auth_users = [
    {
      userarn  = "arn:aws:iam::282467977378:user/gitact"
      username = "gitact"
      groups   = ["system:masters"]
    }
  ]
}
