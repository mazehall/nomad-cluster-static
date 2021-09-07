# Terraform Nomad Cluster Module

A terraform module to provision a rootless nomad cluster without consul. The current version includes the podman plugin installation.

## Constraints

- user with `~/bin` directory in PATH
- systemctl for service control

## Usage

Create or use an existing terraform project and add the repo as a subdirectory.

example main.tf:

```HCL
provider "nomad" {
  address = "http://localhost:4646"
}

module "nomad-server" {
  source = "./nomad-cluster-static"
  cleanup = false                       # [true] to remove the binaries 
  enable_server = true
  ssh_ip = "127.0.0.1"
  ssh_user = var.ssh_user
  ssh_private_key = var.ssh_private_key
  cluster_main = var.cluster_main
  port = "22"
  public_ip = "172.23.186.134"
  nomad_http = 4646
  nomad_rpc = 4647
  nomad_serf = 4648
}

module "nomad-client01" {
  source = "./nomad-cluster-static"
  cleanup = false
  enable_server = false
  ssh_ip = "127.0.0.1"
  ssh_user = var.ssh_user
  ssh_private_key = var.ssh_private_key
  cluster_main = var.cluster_main
  port = "222"
  public_ip = "172.23.186.134"
  nomad_http = 5646
  nomad_rpc = 4647
  nomad_serf = 5648
}
```
