variable public_key_path {
  description = "Path to the public key used to connect to instance"
}
variable appuser_private_key_path {
  description = "Path to the public key used to connect to instance"
}

variable zone {
  description = "Zone"
}

variable db_disk_image {
  description = "Disk image for reddit db"
  default     = "reddit-base"
}

variable name_db {
  description = "name_db"
}
variable "vm_depends_on" {
  type    = any
  default = null
}
