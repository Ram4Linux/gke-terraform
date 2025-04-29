provider "google" {
  credentials = file("gcp-key.json")  # This file will be set up in Jenkins
  project     = var.project_id
  region      = var.region
}

resource "google_container_cluster" "primary" {
  name     = "my-gke-cluster"
  location = var.region

  initial_node_count = 1

  node_config {
    machine_type = "e2-medium"
  }
}
