Hello :) 

Here follows the final push o/

How to access the env:

Console login: https://282467977378.signin.aws.amazon.com/console

How to access the application: http://a34e677ce206e41419bc67832e205833-1545189482.us-east-1.elb.amazonaws.com/

What was done:

- Created an application at `hello-app`
- Configured a Dockerfile to build `hello-app` image
- Developed a helm chart for the app from scratch, using `helm create`
- Created terraform configurations with the following:
    - Terraform state file pushed to S3 bucket for single source of thruth + lock file management in `backend.tf`
    - IAM user for CI in `iam` module
    - Private and Public VPCs in `vpc` module
    - EKS cluster in `eks` module
    - Traefik service type LoadBalancer in `infra-helm` module 
    - ECR repository in `repository` module
    - Security group for Traefik at `security-group` module
    - AWS authentication for CI in `auth` module
- Developed a Github action to create the app image, push to ECR and deploy with `helm upgrade --install`

The design chosen:

- One VPC + two subnets (public and private)
- K8s nodes forced under private subnet for security reasons
- Web application exposed from Traefik LB + Ingress

How to provision the infrastructure:

- Go to AWS Secret Manager and get the secrets there. Create a `terraform.tf` file in root module with key=value from Secret Manager.
- terraform init
- terraform apply

How to make the CI run:

- Any push to main branch. Just write a comment if you prefer.

Challanges:

Mainly the CI part. It would be simpler if I was using ArgoCD, since Argo runs from whitin the cluster and maps applications. I braninstomed a lot until I came with the `auth` module authentication solution, even if this was not the optimal choice. We can discuss this deeper :) 

Improvements:

Many hehe! 
DNS for app exposure, VPN for eks endpoint acess, improvements in security groups, cert manager, shift-left security...
Regarding monitoring, Prometheus stack, fluentd + elastik, APM tools if needed, PagerDuty for on-call management.
Regarding CI/CD, CD tools like ArgoCD and a CI running from inside a cluster.. self hosted or using buildkit + ARC (Action Runner Controller)

Aaand I think that's it! :D

Cheers.

