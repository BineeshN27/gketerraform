resource "kubernetes_service_v1" "myapp1_service" {
  metadata {
    name = "myapp1-service"
  }
  spec {
    selector = {
      # app = kubernetes_pod.example.metadata.0.labels.app
      app = kubernetes_deployment_v1.myapp1.spec.0.selector.0.match_labels.app
    }
    port {
      port        = 80
      target_port = 80
    }
    type = "LoadBalancer"
  }
}

output "lb_ip" {
  value = kubernetes_service_v1.myapp1_service.status[0].load_balancer[0].ingress[0].ip
}


