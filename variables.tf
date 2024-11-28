# Namespace名
variable "namespace_name" {
  default = "secret-test"
}

# Secretのデータ
variable "secret_data" {
  default = {
    password = "cGFzc3dvcmQ=" # Base64エンコード済み
    user     = "dXNlcg=="     # Base64エンコード済み
  }
}

# ConfigMapのデータ
variable "config_map_data" {
  default = {
    username = "myUser"
    password = "myPassword"
  }
}

