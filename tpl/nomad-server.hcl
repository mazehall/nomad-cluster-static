# Generated file content
# source: terraform module nomad-cluster-static

data_dir = "/home/${user}/nomad-data"

ports {
  http = ${nomad_http}
  rpc  = ${nomad_rpc}
  serf = ${nomad_serf}
}

server {
  enabled = true
  raft_protocol = 3
  bootstrap_expect = 1
}

# no consul config
consul {
  auto_advertise      = false
  server_auto_join    = false
}