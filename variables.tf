variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The region to deploy the GKE cluster"
  type        = string
  default     = "us-central1"
}

variable "credentials_file" {
  description = "Path to the GCP credentials JSON file"
  type        = string
}
