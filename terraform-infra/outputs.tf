# output "external_ip_address_app" {
#   value = module.app.external_ip_address_app
# }
# output "external_ip_address_db" {
#   value = module.db.external_ip_address_db
# }
# output "internat_ip_address_db" {
#   value = module.db.internal_ip_address_db
# }
#output "external_ip_address_app-2" {
#  value = yandex_compute_instance.app[1].network_interface.0.nat_ip_address
#}
#output "external_ip_address_app-3" {
#  value = yandex_compute_instance.app[2].network_interface.0.nat_ip_address
#}


#output "reddit-balancer-address" {
#  value = yandex_lb_network_load_balancer.reddit-lb.listener.*.external_address_spec.0.address
#}