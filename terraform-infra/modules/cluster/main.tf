resource "yandex_kubernetes_cluster" "zonal_cluster_resource_name" {
  name        = "k8s-yc-cluster"
  description = "Kubernetes cluster on yandex cloud"

  network_id = var.net_id

  master {
    version = "1.17"
    zonal {
      zone      = var.zone
      subnet_id = var.subnet_id
    }

    public_ip = true

    maintenance_policy {
      auto_upgrade = true

      #   maintenance_window {
      #     start_time = "15:00"
      #     duration   = "3h"
      #   }
    }
  }

  service_account_id      = var.service_account_key_id
  node_service_account_id = var.service_account_key_id

  #   labels = {
  #     my_key       = "my_value"
  #     my_other_key = "my_other_value"
  #   }

  release_channel         = "RAPID"
  network_policy_provider = "CALICO"

  kms_provider {
    key_id = var.kms
  }
}