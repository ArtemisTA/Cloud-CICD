terraform {
  backend "gcs" {
    bucket = "tf-state-github-cicd-486812-ataa-001"
    prefix = "infra"
  }
}
