variable "instance_name" {
  default = "ADC-prometheus-server"
}

variable "aws_region" {
  default = "eu-central-1"
}

variable "blueprint_id" {
  default = "amazon_linux_2023"
}

variable "bundle_id" {
  default = "micro_3_0"
}

variable "key_pair_name" {
  default = "adc-key"
}

variable "static_ip_name" {
  default = "adc-prometheus-server-ip"
}
