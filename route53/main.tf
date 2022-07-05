resource "aws_route53_zone" "newtech-academy"{
  name = "newtech.academy"
}
#RECORD 1
resource "aws_route53_record" "server1-record"{
  zone_id=aws_route53_zone.newtech-academy.zone_id
  name = "server1.newtech.academy"
  type="A"
  ttl="300"
  records = aws_eip.newtech-academy#points to public EIP or 
  #or use records = ["104.236.247.8"]
}
#ECORD 2
resource "aws_route53_record" "www-record" {
  zone_id=aws_route53_zone.newtech-academy.zone_id
  name = "www.newtech.academy"
  type="A"
  ttl="300"
  records = aws_eip.newtech-academy#points to public EIP or 
  #or use records = ["104.236.247.8"]
}
#RECORD 3 (EMAIL)
resource "aws_route53_record" "mail-record" {
  zone_id=aws_route53_zone.newtech-academy.zone_id
  name = "newtech.academy"
  type="MX"
  ttl="300"
  records = [
        "1 aspmx.l.google.com.", #PRIORITY 1 
    "5 alt1.aspmx.l.google.com.",
    "5 alt2.aspmx.l.google.com.",
    "10 aspmx2.googlemail.com.",
    "10 aspmx3.googlemail.com."
    ]
} output "ns-servers" {
  value = aws_route53_zone.newtech-academy.name-servers}"
  }
