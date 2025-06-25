### What was done:

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

### The design chosen:

- One VPC + two subnets (public and private)
- K8s nodes forced under private subnet for security reasons
- Web application exposed from Traefik LB + Ingress

### How to make the CI run:

- Any push to main branch.

Cheers.

