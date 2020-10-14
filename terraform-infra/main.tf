# terraform {
#   required_version = " ~> 0.12.8"
# }

provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}

resource "yandex_kms_symmetric_key" "key-a" {
  name              = "infra-symetric-key"
  description       = "Infrs kms key"
  default_algorithm = "AES_128"
  rotation_period   = "8760h" // equal to 1 year
}

module "cluster" {
  source                 = "./modules/cluster"
  net_id                 = module.vpc.k8s_network_id
  zone                   = var.zone
  subnet_id              = module.vpc.k8s_subnet_id
  service_account_key_id = var.service_account_key_id
  kms                    = "${yandex_kms_symmetric_key.key-a.id}"
}

module "node-pool" {
  source  = "./modules/node-pool"
  cluster = module.cluster.k8s_cluster_id
}

module "vpc" {
  source = "./modules/vpc"
}
