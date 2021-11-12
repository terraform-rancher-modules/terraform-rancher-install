variable "kubeconfig_location" {
  type = string
  description = "Location of the kubeconfig file to interact with the cluster where Rancher needs to be installed"
}

variable "kubeconfig_filename" {
  type = string
  description = "Name of the kubeconfig file"
  default = "kube_config_cluster.yml"
}

variable ingress_tls_source {
  type        = string
  description = "Specify the source of TLS certificates. Valid options: rancher, letsEncrypt, secret"
  default     = "rancher"
}

# This variable is used only if ingress_tls_source is set to either "rancher" or "letsEncrypt
variable "cert_manager_version" {
  type        = string
  description = "Version of cert-manager to install alongside Rancher (format: 0.0.0)"
  default     = "1.5.3"
}

# This option is relevant only if ingress_tls_source is set to "secret"
variable server_certificate {
  type        = string
  description = "Specify the location of the server certificate file (public). Ex: /home/ubuntu/tls.crt"
  default     = null
}

# This option is relevant only if ingress_tls_source is set to "secret"
variable server_certificate_key {
  type        = string
  description = "Specify the location of the server certificate private key file. Ex: /home/ubuntu/tls.key"
  default     = null
}

# This option is relevant only if ingress_tls_source is set to "secret" and if private CA is used
variable use_private_ca {
  type        = bool
  description = "Specify if private CA signed certificates are used"
  default     = false
}

variable server_private_ca_certificate {
  type        = string
  description = "Specify the location of the private CA certificate file. Ex: /home/ubuntu/ca.crt"
  default     = null
}

variable "rancher_version" {
  type        = string
  description = "Rancher server version (format v0.0.0)"
  default     = "v2.6.0"
}

variable "system_default_registry" {
  type        = string
  description = "Specify the default registry for various RKE images. Ex: artifactory.company.com/docker"
  default     = null
}

variable "rancher_image_registry" {
  type        = string
  description = "Specify the registry of rancher image. Ex: artifactory.company.com/docker"
  default     = null
}

variable "rancher_image_registry_username" {
  type        = string
  description = "Specify rancher image registry's username"
  default     = null
}

variable "rancher_image_registry_password" {
  type        = string
  description = "Specify rancher image registry's password"
  default     = null
}

variable "private_registry_url" {
  type        = string
  description = "Specify the private registry where kubernetes images are hosted. Ex: artifactory.company.com/docker"
  default     = null
}

variable "private_registry_username" {
  type        = string
  description = "Specify private registry's username"
  default     = null
}

variable "private_registry_password" {
  type        = string
  description = "Specify private registry's password"
  default     = null
}

# Required
variable "rancher_server_dns" {
  type        = string
  description = "DNS host name of the Rancher server. Ex: rancher.mycompany.com"
}

variable "rancher_helm_repository" {
  type        = string
  description = "Specify the URL where Rancher Helm Repository is hosted"
  default     = "https://releases.rancher.com/server-charts/latest"
}

# Required
variable "admin_password" {
  type        = string
  sensitive = true
  description = "Admin password to use for Rancher server bootstrap"
}

variable "rancher_bootstrap_password" {
  type = string
  sensitive = true
  description = "Bootstrap password for Rancher install"
  default = "admin"
}

variable "rancher_replicas" {
  default = "3"
}