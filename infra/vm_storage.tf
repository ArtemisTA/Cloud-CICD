resource "random_id" "bucket" {
  byte_length = 3
}

locals {
  bucket_name = "github-cicd-simple-${random_id.bucket.hex}"
}

resource "google_storage_bucket" "simple" {
  name          = local.bucket_name
  location      = "europe-west1"
  storage_class = "STANDARD"

  uniform_bucket_level_access = true
}

data "google_compute_network" "default" {
  name = "default"
}

resource "google_compute_instance" "min" {
  name         = "vm-min"
  machine_type = "e2-micro"
  zone         = "europe-west1-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
      size  = 10
      type  = "pd-standard"
    }
  }

  network_interface {
    network = data.google_compute_network.default.id
    access_config {}
  }
}
