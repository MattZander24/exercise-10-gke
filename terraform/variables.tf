variable "project_id" {
  type        = string
  description = "The Google Cloud project ID where the GKE cluster will be created."
}

variable "region" {
  type        = string
  description = "The Google Cloud region for the GKE cluster."
  default     = "us-central1"
}

variable "cluster_name" {
  type        = string
  description = "The name of the GKE cluster."
  default     = "exercise-10-cluster"
}
