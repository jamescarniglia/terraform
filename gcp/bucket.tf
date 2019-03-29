provider "google" {
  credentials = "${file("account.json")}"
  project     = "${var.project}"
  region      = "${var.region}"
  version     = "~> 2.1"
}

 resource "google_storage_bucket" "store" {
    name             = "${var.environment}-${var.service}"
    location         = "${var.region}"
    project          = "${var.project}"
    force_destroy    = false

}

