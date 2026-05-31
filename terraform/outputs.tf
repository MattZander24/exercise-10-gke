output "cluster_name" {
  value       = google_container_cluster.primary.name
  description = "The name of the created GKE cluster."
}

output "cluster_endpoint" {
  value       = google_container_cluster.primary.endpoint
  description = "The API endpoint for the GKE cluster."
}

output "cluster_ca_certificate" {
  value       = google_container_cluster.primary.master_auth[0].cluster_ca_certificate
  description = "The base64-encoded cluster CA certificate for kubeconfig."
}

output "cluster_location" {
  value       = google_container_cluster.primary.location
  description = "The region where the GKE cluster is deployed."
}

output "kubeconfig" {
  value       = <<EOF
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: ${google_container_cluster.primary.master_auth[0].cluster_ca_certificate}
    server: https://${google_container_cluster.primary.endpoint}
  name: ${google_container_cluster.primary.name}
contexts:
- context:
    cluster: ${google_container_cluster.primary.name}
    user: ${google_container_cluster.primary.name}
  name: ${google_container_cluster.primary.name}
current-context: ${google_container_cluster.primary.name}
kind: Config
preferences: {}
users:
- name: ${google_container_cluster.primary.name}
  user:
    auth-provider:
      config:
        cmd-args: config config-helper --format=json
        cmd-path: gcloud
        expiry-key: '{.credential.token_expiry}'
        token-key: '{.credential.access_token}'
      name: gcp
EOF
  description = "A kubeconfig snippet that can be used to authenticate against the GKE cluster using gcloud."
}
