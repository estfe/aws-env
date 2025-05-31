resource "helm_release" "metrics-server" {
  name       = "metrics-server"
  repository = "https://kubernetes-sigs.github.io/metrics-server/"
  chart      = "metrics-server"
  version    = "3.7.0"
  namespace  = "kube-system"

  set {
    name  = "cluster.enabled"
    value = true
  }

  set {
    name  = "metrics.enabled"
    value = true
  }

  set {
    name  = "args"
    value = "{--kubelet-insecure-tls}"
  }
}

resource "helm_release" "traefik" {
  name             = "traefik"
  repository       = "https://traefik.github.io/charts"
  chart            = "traefik"
  version          = "v35.2.0"
  namespace        = "default"
  create_namespace = true

  set {
    name  = "service.type"
    value = "LoadBalancer"
  }

  set {
    name  = "ingressClass.enabled"
    value = true
  }

  set {
    name  = "ingressClass.isDefaultClass"
    value = true
  }

}

resource "helm_release" "arc_controller" {
  name      = "arc"
  namespace = "arc-systems"

  create_namespace = true
  repository       = "oci://ghcr.io/actions/actions-runner-controller-charts"
  chart            = "gha-runner-scale-set-controller"
}

resource "helm_release" "arc_runner_set" {
  name      = "arc-runner-set"
  namespace = "arc-runners"

  create_namespace = true
  repository       = "oci://ghcr.io/actions/actions-runner-controller-charts"
  chart            = "gha-runner-scale-set"

  set {
    name  = "githubConfigUrl"
    value = "https://github.com/estfe/techops"
  }

  set {
    name  = "githubConfigSecret.github_token"
    value = var.github_pat
  }

}