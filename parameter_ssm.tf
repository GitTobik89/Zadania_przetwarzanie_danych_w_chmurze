resource "aws_ssm_parameter" "s3_processed" {
    name  = "s3_processed_bucket_name"
    type  = "String"
    value = aws_s3_bucket.processed_bucket.bucket
}