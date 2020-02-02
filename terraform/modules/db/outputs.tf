

#output "app_lb_ip" {
##  value = "${google_compute_global_address.applbaddress.address}"
#}
output "db_int_ip" {
    value = "${google_compute_instance.db.network_interface.0.network_ip}"
}
output "db_nat_ip" {
    value = "${google_compute_instance.db.network_interface.0.access_config[0].nat_ip}"
}
