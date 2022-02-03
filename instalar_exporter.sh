#!/bin/bash

cd /tmp
wget https://github.com/prometheus/node_exporter/releases/download/v1.3.1/node_exporter-1.3.1.linux-amd64.tar.gz
tar -xzvf node_exporter-1.3.1.linux-amd64.tar.gz
cd node_exporter-1.3.1.linux-amd64
mv node_exporter /usr/local/bin/
groupadd --system node_exporter
useradd -s /sbin/nologin --system -g node_exporter node_exporter
cd /tmp
wget https://raw.githubusercontent.com/RobSM90/instaladores/main/node_exporter.service
mv node_exporter.service /etc/systemd/system/
chown node_exporter:node_exporter /usr/local/bin/node_exporter
systemctl daemon-reload
systemctl start node_exporter
systemctl enable node_exporter