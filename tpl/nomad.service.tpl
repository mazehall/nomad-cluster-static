[Unit]
Description=nomad - rootless 
Documentation=https://www.nomadproject.io/docs/
Wants=network-online.target
After=network-online.target

[Service]
ExecReload=/bin/kill -HUP $MAINPID
ExecStop=/bin/kill -2 $MAINPID
ExecStart=/home/${user}/bin/nomad agent -config /home/${user}/.config/nomad/config.hcl %{ if with_server }-config /home/${user}/.config/nomad/server.hcl%{ endif }
KillMode=process
KillSignal=SIGINT
LimitNOFILE=65536
LimitNPROC=infinity
Restart=on-failure
RestartSec=2
# WorkingDirectory=/home/${user}

[Install]
WantedBy=multi-user.target