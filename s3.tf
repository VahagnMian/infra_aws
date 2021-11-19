resource "aws_s3_bucket" "main-bucket" {
  bucket = "vahagn.acadevopscourse.xyz"
  acl    = "public-read"
  policy = file("policy-main.json")


    website {  
    index_document = "index.html"
    error_document = "error.html"
    }
  
  
  tags = {
    Name        = "main-domain"
    Environment = "Dev"
  }
}


resource "aws_s3_bucket" "secondary-bucket" {
  bucket = "www.vahagn.acadevopscourse.xyz"
  acl    = "public-read-write"

  website {
    redirect_all_requests_to = "https://vahagn.acadevopscourse.xyz"
  }
  
  policy = file("policy-secondary.json")

  tags = {
    Name        = "secondary-domain"
    Environment = "Dev"
  }
}


resource "aws_s3_bucket_object" "object-index" {
  bucket = "vahagn.acadevopscourse.xyz"
  key    = "index.html"
  source = "website_files/index.html"
  content_type = "text/html"

  
}

resource "aws_s3_bucket_object" "object-html" {
  bucket = "vahagn.acadevopscourse.xyz"
  key    = "error.html"
  source = "website_files/error.html"
  content_type = "text/html"

  
}
