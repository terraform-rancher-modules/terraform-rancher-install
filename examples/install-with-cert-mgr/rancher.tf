module "rancher" {
  source = "../.."

  kubeconfig_location = pathexpand("~/code/github.com/leodotcloud/manage-rancher-using-terraform/modules/rke/examples/1-node")
  kubeconfig_filename = "kube_config_cluster.yml"
  admin_password = "Rancher@123$"
  rancher_server_dns = "rancher.dev.mpaluru.com"
}