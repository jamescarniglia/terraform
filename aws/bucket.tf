provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
  version    = "~> 1.58"
}

resource "aws_s3_bucket" "bucket" {
    bucket = "${var.pop}-${var.region}"
    region = "${var.region}"

    versioning {
      enabled = true
    }

    lifecycle {
      prevent_destroy = true
    }

    tags {
      Name = "S3 Remote Store used for ${var.pop} in aws region ${var.region}"
    }
}

