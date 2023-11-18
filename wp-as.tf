resource "kubernetes_horizontal_pod_autoscaler" "wordpress" {
  metadata {
    name = "wordpress"
  }

  spec {
    scale_target_ref {
      kind = "Deployment"
      name = kubernetes_deployment.wordpress.metadata[0].name
    }

    min_replicas = 1
    max_replicas = 5

    target_cpu_utilization_percentage = 50
  }
}