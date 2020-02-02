resource "google_compute_instance" "db" {
  name         = var.name_db
  machine_type = "g1-small"
  #zone = "us-central1-a"
  zone  = var.zone
  #count = var.count_db
  boot_disk {
    initialize_params {
      image = var.db_disk_image
    }
  }
  tags = ["reddit-db"]
  network_interface {
  network = "default"
  access_config {}
  }
  depends_on = [var.vm_depends_on]
   provisioner "remote-exec" {
    script = "${path.module}/install_mongodb.sh"
  }

  connection {
    type  = "ssh"
    host  = self.network_interface[0].access_config[0].nat_ip
    user  = "appuser"
    agent = false
    # путь до приватного ключа
    private_key = file(var.appuser_private_key_path)
  }
}
resource "google_compute_firewall" "firewall_mongo" {
  name = "allow-mongo-default"
  network = "default"
  allow {
    protocol = "tcp"
    ports = ["27017"]
  }
  target_tags = ["reddit-db"]
  source_tags = ["reddit-app"]
}
resource "google_compute_address" "db_ip" {
name = "reddit-db-ip"
}
