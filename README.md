# Terraform Module | Rancher Install

Terraform module to install Rancher helm chart on any given kubernetes cluster.

### Usage

```hcl
module "rancher_install" {
  source = "github.com/terraform-rancher-modules/terraform-rancher-install"

  rancher_server_dns = "rancher.example.com"
}
```

Check examples folder for more usage ideas.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.4.1 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.6.1 |
| <a name="requirement_rancher2"></a> [rancher2](#requirement\_rancher2) | 1.21.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | >= 2.4.1 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | >= 2.6.1 |
| <a name="provider_rancher2.bootstrap"></a> [rancher2.bootstrap](#provider\_rancher2.bootstrap) | 1.21.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.cert_manager](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.rancher_server](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_namespace.cattle-system](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_secret.helm_image_pull_secret](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |
| [kubernetes_secret.tls-ca](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |
| [kubernetes_secret.tls-rancher-ingress](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |
| [rancher2_bootstrap.admin](https://registry.terraform.io/providers/rancher/rancher2/1.21.0/docs/resources/bootstrap) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_password"></a> [admin\_password](#input\_admin\_password) | Admin password to use for Rancher server bootstrap | `string` | n/a | yes |
| <a name="input_cert_manager_version"></a> [cert\_manager\_version](#input\_cert\_manager\_version) | Version of cert-manager to install alongside Rancher (format: 0.0.0) | `string` | `"1.5.3"` | no |
| <a name="input_ingress_tls_source"></a> [ingress\_tls\_source](#input\_ingress\_tls\_source) | Specify the source of TLS certificates. Valid options: rancher, letsEncrypt, secret | `string` | `"rancher"` | no |
| <a name="input_kubeconfig_filename"></a> [kubeconfig\_filename](#input\_kubeconfig\_filename) | Name of the kubeconfig file | `string` | `"kube_config_cluster.yml"` | no |
| <a name="input_kubeconfig_location"></a> [kubeconfig\_location](#input\_kubeconfig\_location) | Location of the kubeconfig file to interact with the cluster where Rancher needs to be installed | `string` | n/a | yes |
| <a name="input_private_registry_password"></a> [private\_registry\_password](#input\_private\_registry\_password) | Specify private registry's password | `string` | `null` | no |
| <a name="input_private_registry_url"></a> [private\_registry\_url](#input\_private\_registry\_url) | Specify the private registry where kubernetes images are hosted. Ex: artifactory.company.com/docker | `string` | `null` | no |
| <a name="input_private_registry_username"></a> [private\_registry\_username](#input\_private\_registry\_username) | Specify private registry's username | `string` | `null` | no |
| <a name="input_rancher_bootstrap_password"></a> [rancher\_bootstrap\_password](#input\_rancher\_bootstrap\_password) | Bootstrap password for Rancher install | `string` | `"admin"` | no |
| <a name="input_rancher_helm_repository"></a> [rancher\_helm\_repository](#input\_rancher\_helm\_repository) | Specify the URL where Rancher Helm Repository is hosted | `string` | `"https://releases.rancher.com/server-charts/latest"` | no |
| <a name="input_rancher_image_registry"></a> [rancher\_image\_registry](#input\_rancher\_image\_registry) | Specify the registry of rancher image. Ex: artifactory.company.com/docker | `string` | `null` | no |
| <a name="input_rancher_image_registry_password"></a> [rancher\_image\_registry\_password](#input\_rancher\_image\_registry\_password) | Specify rancher image registry's password | `string` | `null` | no |
| <a name="input_rancher_image_registry_username"></a> [rancher\_image\_registry\_username](#input\_rancher\_image\_registry\_username) | Specify rancher image registry's username | `string` | `null` | no |
| <a name="input_rancher_replicas"></a> [rancher\_replicas](#input\_rancher\_replicas) | n/a | `string` | `"3"` | no |
| <a name="input_rancher_server_dns"></a> [rancher\_server\_dns](#input\_rancher\_server\_dns) | DNS host name of the Rancher server. Ex: rancher.mycompany.com | `string` | n/a | yes |
| <a name="input_rancher_version"></a> [rancher\_version](#input\_rancher\_version) | Rancher server version (format v0.0.0) | `string` | `"v2.6.0"` | no |
| <a name="input_server_certificate"></a> [server\_certificate](#input\_server\_certificate) | Specify the location of the server certificate file (public). Ex: /home/ubuntu/tls.crt | `string` | `null` | no |
| <a name="input_server_certificate_key"></a> [server\_certificate\_key](#input\_server\_certificate\_key) | Specify the location of the server certificate private key file. Ex: /home/ubuntu/tls.key | `string` | `null` | no |
| <a name="input_server_private_ca_certificate"></a> [server\_private\_ca\_certificate](#input\_server\_private\_ca\_certificate) | Specify the location of the private CA certificate file. Ex: /home/ubuntu/ca.crt | `string` | `null` | no |
| <a name="input_system_default_registry"></a> [system\_default\_registry](#input\_system\_default\_registry) | Specify the default registry for various RKE images. Ex: artifactory.company.com/docker | `string` | `null` | no |
| <a name="input_use_private_ca"></a> [use\_private\_ca](#input\_use\_private\_ca) | Specify if private CA signed certificates are used | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_rancher_url"></a> [rancher\_url](#output\_rancher\_url) | n/a |

