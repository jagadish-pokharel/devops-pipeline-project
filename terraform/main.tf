terraform {
  required_providers {
    kubernetes = {  # Changed from "kubernetics"
      source = "hashicorp/kubernetes"
    }
  }
  required_version = ">=1.0.0"
}

provider "kubernetes" {  # Changed from "kubernetics"
  config_path = "~/.kube/config"  # Removed trailing space after "config"
}

resource "kubernetes_namespace" "pipeline" {  # Changed from "kubernetics_namespace"
  metadata {
    name = "devops-pipeline"
  }
}

# Define the application deployment with 2 replicas
resource "kubernetes_deployment" "app" {
  metadata {
    name      = "pipeline-app"
    namespace = kubernetes_namespace.pipeline.metadata[0].name
    labels = {
      app = "pipeline-app"
    }
  }

  spec {
    replicas = 2
    strategy {
        type = "RollingUpdate"

        rolling_update {
            max_surge = "1"
            max_unavailable = "0"
        }
    }

    selector {
      match_labels = {
        app = "pipeline-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "pipeline-app"
        }
      }

      spec {
        container {
          image = "pipeline-app:v2"
          name  = "pipeline-app"
          image_pull_policy = "Always"

          port {
            container_port = 3000
          }
        }
      }
    }
  }
}

# Expose the app via a NodePort service on port 30100
resource "kubernetes_service" "app" {  # Changed from "kubernetics_service"
  metadata {
    name      = "pipeline-app-service"
    namespace = kubernetes_namespace.pipeline.metadata[0].name
  }

  spec {
    selector = {
      app = "pipeline-app"
    }

    type = "NodePort"

    port {
      port        = 3000
      target_port = 3000
      node_port   = 30100
    }
  }
}