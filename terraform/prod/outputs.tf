#output "app_external_ip" {
#  value = google_compute_instance.app[0].network_interface[0].access_config[0].nat_ip
#}


#output "app_lb_ip" {
##  value = "${google_compute_global_address.applbaddress.address}"
#}
output "app_external_ip" {
  value = module.app.app_external_ip
}
