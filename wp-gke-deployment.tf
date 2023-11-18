resource "kubernetes_deployment" "wordpress" {
  metadata {
    name = "wordpress"
  }

  depends_on = [
    google_container_cluster.gke_cluster
  ]

  spec {
    replicas = 2
    selector {
      match_labels = {
        app = "wordpress"
      }
    }

    template {
      metadata {
        labels = {
          app = "wordpress"
        }
      }

      spec {
        container {
          image = "wordpress:latest"
          name  = "wordpress"

          env {
            name  = "WORDPRESS_DB_HOST"
            value = local.cloud_sql_private_ip
          }

          env {
            name  = "WORDPRESS_DB_USER"
            value = "wp_user"
          }

          env {
            name  = "WORDPRESS_DB_PASSWORD"
            value = var.db_password
          }

          env {
            name  = "WORDPRESS_DB_NAME"
            value = "wordpress"
          }

          port {
            container_port = 80
          }

        }
      }
    }
  }
}
