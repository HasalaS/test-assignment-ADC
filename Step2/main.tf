resource "aws_lightsail_instance" "prometheus_instance" {
  name              = var.instance_name
  availability_zone = "${var.aws_region}a"
  blueprint_id      = var.blueprint_id
  bundle_id         = var.bundle_id
  key_pair_name     = var.key_pair_name
}

resource "aws_lightsail_static_ip" "static_ip" {
  name = var.static_ip_name
}

resource "aws_lightsail_static_ip_attachment" "ip_attachment" {
  static_ip_name = aws_lightsail_static_ip.static_ip.name
  instance_name  = aws_lightsail_instance.prometheus_instance.name
}

resource "aws_lightsail_instance_public_ports" "example" {
  instance_name = aws_lightsail_instance.prometheus_instance.name

  port_info {
    protocol  = "tcp"
    from_port = 80
    to_port   = 80
  }

  port_info {
    protocol  = "tcp"
    from_port = 22
    to_port   = 22
  }
  port_info {
    protocol  = "tcp"
    from_port = 9090
    to_port   = 9090
  }
}
