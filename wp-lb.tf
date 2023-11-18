resource "kubernetes_service" "wordpress" {
  metadata {
    name = "wordpress"
  }

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