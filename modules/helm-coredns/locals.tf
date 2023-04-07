locals {
  base_values =  yamldecode(templatefile("${path.module}/helm/values.yaml.tftpl", {
    clusterIP     = var.global_vars.k8s-addresses.dns_address
  }))

  merge_values = merge(local.base_values, var.extra_values)
}