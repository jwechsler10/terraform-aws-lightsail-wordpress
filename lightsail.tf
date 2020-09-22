resource "aws_lightsail_instance" "wordpress_instance" {
  name              = "wordpress_instance"
  availability_zone = "us-east-2b"
  blueprint_id      = "wordpress_4_9_8"
  bundle_id         = "micro_2_0"
  user_data         = file("${path.module}/scripts/startup.sh")
  tags = {
    Name = "wordpress"
  }
}

resource "aws_lightsail_static_ip_attachment" "wordpress_instance_attach" {
  static_ip_name = aws_lightsail_static_ip.wordpress_static_ip.id
  instance_name  = aws_lightsail_instance.wordpress_instance.id
}

resource "aws_lightsail_static_ip" "wordpress_static_ip" {
  name = "wordpress"
}