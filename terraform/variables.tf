variable project {
  description = "Project ID"
}
variable region {
  description = "Region"
  # Значение по умолчанию
  default = "europe-north1"
}
variable "zone" {
  description = "Zone"
  default     = "europe-north1-c"
}

variable appuser_public_key_path {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}
variable appuser_private_key_path {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}

variable sir0p_public_key_path {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}

variable disk_image {
  description = "Disk image"
}
variable name_app {
  description = "name_app"
}

variable count_app {
  description = "count_app"
}

variable health_check_port {
  description = "Port for healthcheck backend service."
}

variable instance_group_name_port {
  default = "http"
}

variable instance_group_port {
  default = "9292"
}

variable forwarding_rule_port_range {
  default = "80"
}

variable hc_check_interval_sec {
  default = "1"
}

variable hc_timeout_sec {
  default = "1"
}
