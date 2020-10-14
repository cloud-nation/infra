output "k8s_subnet_id" {
  value = yandex_vpc_subnet.app-subnet.id
}
output "k8s_network_id" {
  value = yandex_vpc_network.app-network.id
}
