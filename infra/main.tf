# trigger CI:
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

provider "google" {
  project = "github-cicd-486812"
  region  = "europe-west1"
  zone    = "europe-west1-b"
}
