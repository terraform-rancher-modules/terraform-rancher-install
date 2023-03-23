provider "helm" {
  debug           = true
  kubernetes {
    config_path = var.kubeconfig_file
  }
}

provider "kubernetes" {
  config_path = var.kubeconfig_file
  insecure    = true
}
