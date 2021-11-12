# Rancher2 bootstrapping provider
provider "rancher2" {
  alias = "bootstrap"

  api_url  = "https://${var.rancher_server_dns}"
  insecure = true
  # ca_certs  = data.kubernetes_secret.rancher_cert.data["ca.crt"]
  bootstrap = true
}

resource "rancher2_bootstrap" "admin" {
  depends_on = [
    helm_release.rancher_server
  ]

  provider = rancher2.bootstrap

  # TODO: Figure out how to make this generic
  # Need to uncomment this line for pre 2.6.0
  #initial_password = var.rancher_bootstrap_password
  password  = var.admin_password
  telemetry = false
}