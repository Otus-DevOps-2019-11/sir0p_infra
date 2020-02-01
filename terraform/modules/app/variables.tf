variable public_key_path {
  description = "Path to the public key used to connect to instance"
}

variable zone {
  description = "Zone"
}

variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-app"
}
variable name_app {
  description = "name_app"
}

variable count_app {
  description = "count_app"
}
