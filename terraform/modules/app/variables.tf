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
variable "vm_depends_on" {
  type    = any
  default = null
}

variable "database_url" {
  description = "Reddit app database url"
  default     = "127.0.0.1:27017"
}
