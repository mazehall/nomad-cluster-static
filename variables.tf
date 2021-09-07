variable "nomad_version" {
  type    = string
  default = "1.1.4"
}
variable "nomad-driver-podman_version" {
  type    = string
  default = "0.3.0"
}

variable "enable_server" {
  type    = bool
  default = false
}

variable "enable_client" {
  type    = bool
  default = true
}

variable "cleanup" {
  type    = bool
  default = false
}

variable "ssh_ip" {
  type    = string
}

variable "ssh_user" {
  type    = string
}

variable "ssh_private_key" {
  type    = string
}

variable "cluster_main" {
  type    = string
}

variable "port" {
  type    = string
  default = "22"
}

variable "nomad_http" {
  type    = string
  default = "4646"
}

variable "nomad_rpc" {
  type    = string
  default = "4647"
}

variable "nomad_serf" {
  type    = string
  default = "4648"
}

variable "public_ip" {
  type    = string
}
