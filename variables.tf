variable "kubeconfig_file" {
  description = "The kubeconfig to use to interact with the cluster"
  default     = "~/.kube/config"
}

variable "cert_manager_namespace" {
  description = "Namesapce to install cert-manager"
  default     = "cert-manager"
}

variable "cert_manager_version" {
  description = "Version of cert-manager to install"
  default     = "v1.5.1"
}

variable "cert_manager_enable" {
  description = "Install cert-manager even if not needed for Rancher, useful if migrating to certificates"
  default     = false
}

variable "rancher_additional_helm_values" {
  description = "Helm options to provide to the Rancher helm chart"
  default     = []
  type        = list(string)
}

variable "rancher_antiaffinity" {
  description = "Value for antiAffinity when installing the Rancher helm chart (required/preferred)"
  default     = "required"
}

variable "rancher_bootstrap_password" {
  description = "Password to use for bootstrapping Rancher"
  default     = "admin"
}

variable "rancher_hostname" {
  description = "Value for hostname when installing the Rancher helm chart"
}

variable "rancher_replicas" {
  description = "Value for replicas when installing the Rancher helm chart"
  default     = 3
}

variable "rancher_version" {
  description = "Rancher version to install"
  default     = null
}

variable "cacerts_path" {
  default     = null
  description = "Private CA certificate to use for Rancher UI/API connectivity"
}

variable "tls_crt_path" {
  description = "TLS certificate to use for Rancher UI/API connectivity"
  default     = null
}

variable "tls_key_path" {
  description = "TLS key to use for Rancher UI/API connectivity"
  default     = null
}

variable "tls_source" {
  description = "Value for ingress.tls.source when installing the Rancher helm chart"
  default     = "rancher"
}