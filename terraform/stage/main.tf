terraform {
  # Версия terraform
  required_version = "~>0.12.18"

}

provider "google" {
  # Версия провайдера
  version = "2.15"

  # ID проекта
  project = var.project
  region  = var.region
}
resource "google_compute_project_metadata_item" "ssh-keys" {
  key   = "ssh-keys"
  value = "sir0p:${file(var.sir0p_public_key_path)}appuser:${file(var.appuser_public_key_path)}"
}
# решение на память
# metadata = {
#  ssh-keys = <<EOF
#       appuser:${file(var.appuser_public_key_path)}
#       sir0p:${file(var.sir0p_public_key_path)}
#       EOF
#}


module "app" {
  source          = "../modules/app"
  public_key_path = var.appuser_public_key_path
  appuser_private_key_path = var.appuser_private_key_path
  count_app       = var.count_app
  zone            = var.zone
  app_disk_image  = var.app_disk_image
  name_app        = var.name_app
  database_url       = "${module.db.db_int_ip}:27017"

  vm_depends_on = [
    google_compute_project_metadata_item.ssh-keys,
    module.vpc,
    module.db
  ]
}

module "db" {
  source          = "../modules/db"
  public_key_path = var.appuser_public_key_path
  appuser_private_key_path = var.appuser_private_key_path
  zone            = var.zone
  name_db         = var.name_db
  db_disk_image   = var.db_disk_image
  vm_depends_on = [
    google_compute_project_metadata_item.ssh-keys,
  ]
}
module "vpc" {
  source        = "../modules/vpc"
  source_ranges = var.source_ranges

}
