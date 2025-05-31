module "tfaccount" {
  source = "terraform-aws-modules/iam/aws//modules/iam-user"

  name                  = "tfaccount"
  create_iam_access_key = false 
  policy_arns = [
    "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy",
    "arn:aws:iam::aws:policy/AmazonEKSServicePolicy",
    "arn:aws:iam::aws:policy/AmazonVPCFullAccess",
    "arn:aws:iam::aws:policy/IAMFullAccess",
    "arn:aws:iam::aws:policy/AmazonEC2FullAccess",
    "arn:aws:iam::aws:policy/AmazonS3FullAccess",
    "arn:aws:iam::aws:policy/AdministratorAccess"
  ]
}

module "gitact" {
  source = "terraform-aws-modules/iam/aws//modules/iam-user"
  
  name  = "gitact"
  create_iam_access_key = false
  
  policy_arns = [
   "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
  ] 
}


#resource "aws_iam_policy" "tagging" {
#  name        = "custom-resource"
#  description = ""
#  policy      = jsonencode({
#    Version = "2012-10-17",
#    Statement = [
#      {
#        Effect   = "Allow",
#        Action   = [
#          "kms:TagResource",
#          "kms:CreateKey",
#          "logs:TagResource"
#        ],
#        Resource = "*"
#      }
#    ]
#  })
#}