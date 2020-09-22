resource "aws_route53_record" "wordpress" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "eats-tina.jw-kn.com"
  type    = "A"
  ttl     = "300"
  records = [aws_lightsail_static_ip.wordpress_static_ip.ip_address]
}