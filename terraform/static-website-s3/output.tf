
output "index_file_url" {
  value       = "https://${aws_s3_bucket.my_sample_bucket.bucket}.s3.amazonaws.com/${aws_s3_object.index_file.key}"
  description = "Public URL for index.html"
}