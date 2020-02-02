terraform {
    backend "gcs" {
    bucket  = "production-storage-bucket-infra-264217"
    prefix  = "terraform/state"
  }
}
