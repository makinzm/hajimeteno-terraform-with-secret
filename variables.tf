# Namespace名
variable "namespace_name" {
  default = "secret-test"
}

# Secretのデータ
variable "secret_data" {
  default = {
    password = "password"
    user     = "user"
  }
}

# ConfigMapのデータ
variable "config_map_data" {
  default = {
    username = "myUser"
    password = "myPassword"
  }
}

