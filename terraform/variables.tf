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
