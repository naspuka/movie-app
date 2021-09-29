terraform {
    required_version = "~= 0.12"
    backend "gcs" {
        bucket = "project_id-terraform-state"
        prefix = "terraform/state"
        credentials = ".keys/gcp_account.json"
    }
}
provider "google" {
    credentials = file(".keys/gcp_account.json")
    project = "project_id"
    region = "us-central"
}
resource "google_container_cluster" "gke-cluster" {
    name = "ob-cluster"
    location = "us-central-a"
    remove_default_node_pool = true
    initial_node_count = 1
}
resource "google_container_node_pool" "preemptible_node_pool" {
    name = "default-pool"
    location = "us-central-a"
    cluster = google_container_cluster.gke-cluster.name
    node_count = 2

    node_config {
        preemptible = true
        machine_type = "n1-standard-1"
        oauth_scopes = [
            "storage-ro",
            "logging-writes",
            "monitoring"
        ]
    }
}