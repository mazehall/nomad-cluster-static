# Generated file content
# source: terraform module nomad-cluster-static

data_dir = "/home/${user}/nomad-data"

client {
  enabled = true
  servers = ["${cluster_main}:${nomad_rpc}"]
}

plugin "nomad-driver-podman" {
  config {
    volumes {
      enabled      = true
      selinuxlabel = "z"
    }
  }
}

plugin "raw_exec" {
  config {
    enabled = true
  }
}

telemetry {
  # you should align the collection_interval to your
  # metrics system. A very short interval of 1-2 secs
  # puts considerable strain on your system
  collection_interval = "10s"
}

ports {
  http = ${nomad_http}
  rpc  = ${nomad_rpc}
}

# no consul config
consul {
  auto_advertise      = false
  client_auto_join    = false
}