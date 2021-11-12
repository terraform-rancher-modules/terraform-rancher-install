provider "kubernetes" {
  config_path = format("%s/%s", var.kubeconfig_location, var.kubeconfig_filename)
}

provider "helm" {
  kubernetes {
    config_path = format("%s/%s", var.kubeconfig_location, var.kubeconfig_filename)
  }
}