locals {
  rancher_default_helm_values = [
    "antiAffinity: ${var.rancher_antiaffinity}",
    "ingress.tls.source: ${var.tls_source}",
    "hostname: ${var.rancher_hostname}",
    "bootstrapPassword: ${var.rancher_bootstrap_password}",
    "replicas: ${var.rancher_replicas}"
  ]
  rancher_helm_values = distinct(flatten([var.rancher_additional_helm_values, local.rancher_default_helm_values]))
}

resource "kubernetes_secret" "tls_rancher_ingress" {
  count = var.tls_source == "secret" ? 1 : 0
  metadata {
    name      = "tls-rancher-ingress"
    namespace = helm_release.rancher.namespace
  }
  data = {
    "tls.crt" = file(var.tls_crt_path)
    "tls.key" = file(var.tls_key_path)
  }
  type = "kubernetes.io/tls"

  lifecycle {
    ignore_changes = [metadata]
  }
}

resource "kubernetes_secret" "tls_ca" {
  count = var.tls_source == "secret" ? 1 : 0
  metadata {
    name      = "tls-ca"
    namespace = helm_release.rancher.namespace
  }
  data = {
    "cacerts.pem" = file(var.cacerts_path)
  }

  lifecycle {
    ignore_changes = [metadata]
  }
}

resource "helm_release" "cert_manager" {
  count            = var.tls_source == "rancher" || var.tls_source == "letsEncrypt" || var.cert_manager_enable ? 1 : 0
  name             = "cert-manager"
  repository       = "https://charts.jetstack.io"
  chart            = "cert-manager"
  namespace        = var.cert_manager_namespace
  version          = var.cert_manager_version
  wait             = true
  create_namespace = true

  set {
    name  = "installCRDs"
    value = "true"
  }
}

resource "helm_release" "rancher" {
  depends_on       = [helm_release.cert_manager]
  name             = "rancher"
  repository       = "https://releases.rancher.com/server-charts/stable"
  chart            = "rancher"
  namespace        = "cattle-system"
  version          = var.rancher_version
  wait             = true
  create_namespace = true

  dynamic "set" {
    for_each = local.rancher_helm_values
    content {
      name  = split(":", set.value)[0]
      value = trimprefix(split(":", set.value)[1], " ")
    }
  }
}