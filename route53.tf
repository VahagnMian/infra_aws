
resource "aws_route53_record" "www" {
 
  zone_id = "Z05653241R5IVTJTXCHBM"
  name    = "vahagn.acadevopscourse.xyz"
  type    = "A"
  
  alias {
    name = aws_cloudfront_distribution.s3_distribution.domain_name
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false

  }
}