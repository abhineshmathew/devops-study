resource "aws_s3_bucket" "my_sample_bucket" {
  bucket = "test${random_string.bucket_suffix.result}"
}


resource "aws_s3_object" "index_file" {
    bucket  = aws_s3_bucket.my_sample_bucket.id
    key     = "index.html"
    source  = "./index.html"
    content_type = "text/html"
}
resource "aws_s3_object" "styles_file" {
    bucket  = aws_s3_bucket.my_sample_bucket.id
    key     = "styles.css"
    source  = "./styles.css"
    content_type = "text/css"
}

resource "aws_s3_bucket_public_access_block" "allow_public_access" {
  bucket                  = aws_s3_bucket.my_sample_bucket.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
  depends_on = [aws_s3_bucket.my_sample_bucket]
}


resource "aws_s3_bucket_policy" "public_read_policy" {
  bucket = aws_s3_bucket.my_sample_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.my_sample_bucket.arn}/*"
      }
    ]
  })
  depends_on = [aws_s3_bucket_public_access_block.allow_public_access]
}
