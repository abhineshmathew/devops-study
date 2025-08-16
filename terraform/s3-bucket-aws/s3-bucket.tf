resource "aws_s3_bucket" "my_sample_bucket" {
    bucket = "abhinesh12345612345"
}

resource "aws_s3_object" "example_file" {
    bucket  = aws_s3_bucket.my_sample_bucket.id
    key     = "example.txt"
    source  = "./example.txt" 
    acl     = "private"
}