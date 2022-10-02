resource "aws_route53_zone" "newtech-academy" {
  name = "newtech.academy"
}

resource "aws_route53_record" "server1-record" {
  name = "server1.newtech.academy"
  type = "A"
  ttl  = "300"
  records = ["3.91.172.93"]
  zone_id = aws_route53_zone.newtech-academy.zone_id
}

resource "aws_route53_record" "www-record" {
  name    = "www.newtech.academy"
  type    = "A"
  ttl     = "300"
  records = ["3.91.172.93"]
  zone_id = aws_route53_zone.newtech-academy.zone_id
}

resource "aws_route53_record" "mail1-record" {
  name    = "newtech.academy"
  type    = "MX"
  ttl     = "300"
  zone_id = aws_route53_zone.newtech-academy.zone_id
  records = [
    "1 aspmx.l.google.com.",
    "5 alt1.aspmx.l.google.com.",
    "5 alt2.aspmx.l.google.com.",
    "10 aspmx2.googlemail.com.",
    "10 aspmx3.googlemail.com.",
  ]
}

output "ns-servers" {
  value = aws_route53_zone.newtech-academy.name_servers
}