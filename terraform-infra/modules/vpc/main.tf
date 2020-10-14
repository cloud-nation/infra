resource "yandex_vpc_network" "app-network" {
  name = "k8s-network"
}

resource "yandex_vpc_subnet" "app-subnet" {
  name           = "k8s-subnet"
  zone           = "ru-central1-a"
  network_id     = "${yandex_vpc_network.app-network.id}"
  v4_cidr_blocks = ["192.168.30.0/24"]
}
