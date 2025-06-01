resource "helm_release" "metrics-server" {
  name       = "metrics-server"
  repository = "https://kubernetes-sigs.github.io/metrics-server/"
  chart      = "metrics-server"
  version    = "3.7.0"
  namespace  = "kube-system"

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

 # https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.6/guide/service/annotations/#security-groups

  set {
    name  = "service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-security-groups"
    value = "traefik_sg"
  }

}
