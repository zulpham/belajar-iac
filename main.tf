data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "pertama" {
  bucket = "${var.bucket_name_prefix}-${data.aws_caller_identity.current.account_id}"

  tags = {
    Name = "bucket-pertama"
  }
}
