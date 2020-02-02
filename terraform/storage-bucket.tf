provider "google" {
  version = "~> 2.15"
  project = var.project
  region  = var.region
}

module "storage-bucket" {
  source  = "git::https://github.com/SweetOps/terraform-google-storage-bucket.git?ref=master"
  #version = "0.3.0"
  stage       = "production"
  # Имя поменяйте на другое
  name = "storage-bucket-${var.project}"
  location    = var.region
}

output storage-bucket_url {
  value = module.storage-bucket.url
}
