# Install cert-manager helm chart
resource "helm_release" "cert_manager" {
  count = var.ingress_tls_source != "secret" ? 1 : 0

  repository       = "https://charts.jetstack.io"
  name             = "cert-manager"
  chart            = "cert-manager"
  version          = "v${var.cert_manager_version}"
  namespace        = "cert-manager"
  create_namespace = true
  wait             = true

  set {
    name  = "installCRDs"
    value = "true"
  }
}