variable "cluster_name" {
  default = "ADC-test-cluster"
}

variable "aws_region" {
  default = "eu-central-1"
}

variable "node_instance_type" {
  default = "t3.medium"
}

variable "desired_capacity" {
  default = 2
}

variable "max_size" {
  default = 3
}

variable "min_size" {
  default = 1
}
