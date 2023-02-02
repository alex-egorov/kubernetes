resource "helm_release" "ycc" {
  name       = var.release_name

  repository = var.chart_repo
  chart      = var.chart_name
  version    = var.chart_version

  namespace  = var.namespace
  create_namespace  = true
  values = [
    templatefile("${path.module}/helm/values.yaml", {
        yandex_cloud_controller_sa  = local.yandex-k8s-controllers-sa
        cluster_name                = local.cluster_name
        pod_cidr                    = local.pod_cidr
        k8s_api_server              = var.k8s_api_server
        k8s_api_server_port         = local.k8s_api_server_port
    })
  ]
  timeout   = 6000
  wait      = true
  atomic    = true
}
