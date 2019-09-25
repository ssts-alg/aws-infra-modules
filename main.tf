resource "aws_s3_bucket" "s3_bucket" {
  count  = "${var.number_of_buckets_to_create}"
  bucket = "${var.bucket_name}"
  acl    = "${var.acl}"

  versioning {
    enabled = "${var.versioning}"
  }

  tags = "${var.tags}"
}

output "id" {
  value = "${aws_s3_bucket.s3_bucket.id}"
}

output "arn" {
  value = "${aws_s3_bucket.s3_bucket.arn}"
}

output "base_policy_statement" {
  value = "${data.aws_iam_policy_document.s3_bucket.json}"
}
