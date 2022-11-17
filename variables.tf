variable "region" {
  description = "Region to deploy infrastructure"
  type = string
  default ="us-east-1"
}

variable "my_access_key" {
    description = "Access-key-for-AWS"
    default = "no_access_key_value_found"
  }
  
  variable "my_secret_key" {
    description = "Secret-key-for-AWS"
    default = "no_secret_key_value_found"
  }