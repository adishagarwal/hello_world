provider "google" {
  region  = "us-central1"
  zone    = "us-central1-c"
  credentials = file("creds.json")
}

resource "google_container_node_pool" "good_node_pool" {
  name       = "mocksuccess"
  cluster    = "my-cluster-1"
  project = "tf-deployer-2"
  initial_node_count = 3

  node_config {
    preemptible  = true
    machine_type = "e2-medium"
  }
}


resource "google_container_node_pool" "my_bad_node_pool_in_project1" {
  name       = "my-bad-node-pool-1"
  cluster    = "my-cluster-1"
  project = "tf-deployer-2"
  initial_node_count = 3

  node_config {
    preemptible  = true
    machine_type = "e2-medium"
  }
}
