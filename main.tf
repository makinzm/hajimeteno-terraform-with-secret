provider "kubernetes" {
  config_path = "~/.kube/config" # Kubernetesの設定ファイルを指定
}

# Namespaceの作成
resource "kubernetes_namespace" "secret_test" {
  metadata {
    name = var.namespace_name
  }
}

# Secretの作成
resource "kubernetes_secret" "my_secret" {
  metadata {
    name      = "my-secret"
    namespace = kubernetes_namespace.secret_test.metadata[0].name
  }

  data = var.secret_data

  type = "Opaque"
}

# ConfigMapの作成
resource "kubernetes_config_map" "my_config" {
  metadata {
    name      = "my-config"
    namespace = kubernetes_namespace.secret_test.metadata[0].name
  }

  data = var.config_map_data
}

# Podの作成
resource "kubernetes_pod" "secret_pod" {
  metadata {
    name      = "secret-pod"
    namespace = kubernetes_namespace.secret_test.metadata[0].name
  }

  spec {
    container {
      name  = "my-container"
      image = "alpine"

      command = ["sh", "-c", "env"]

      env {
        name = "SECRET_USERNAME"
        value_from {
          secret_key_ref {
            name = kubernetes_secret.my_secret.metadata[0].name
            key  = "user"
          }
        }
      }

      env {
        name = "SECRET_PASSWORD"
        value_from {
          secret_key_ref {
            name = kubernetes_secret.my_secret.metadata[0].name
            key  = "password"
          }
        }
      }

      env {
        name = "CONFIG_USERNAME"
        value_from {
          config_map_key_ref {
            name = kubernetes_config_map.my_config.metadata[0].name
            key  = "username"
          }
        }
      }

      env {
        name = "CONFIG_PASSWORD"
        value_from {
          config_map_key_ref {
            name = kubernetes_config_map.my_config.metadata[0].name
            key  = "password"
          }
        }
      }
    }
  }
}

