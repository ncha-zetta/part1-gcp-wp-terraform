resource "kubernetes_service" "wordpress" {
  metadata {
    name = "wordpress"
  }

  depends_on = [
    google_container_cluster.gke_cluster
  ]

  spec {
    selector = {
      app = "wordpress"
    }

    port {
      port        = 80
      target_port = 80
    }

    type = "LoadBalancer"
  }
}