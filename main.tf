provider "google" {
  credentials = file(var.credentials_file)  # This is where the GCP key file will be injected
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

output "cluster_name" {
  value = google_container_cluster.primary.name
}

output "endpoint" {
  value = google_container_cluster.primary.endpoint
}
