#!/bin/bash

cd /tmp
wget https://github.com/prometheus/mysqld_exporter/releases/download/v0.13.0/mysqld_exporter-0.13.0.linux-amd64.tar.gz
tar -xzvf mysqld_exporter-0.13.0.linux-amd64.tar.gz
mv /tmp/mysqld_exporter-0.13.0.linux-amd64/mysqld_exporter /usr/local/bin/
chmod +x /usr/local/bin/mysqld_exporter
groupadd --system prometheus
useradd -s /sbin/nologin --system -g prometheus prometheus
cd /etc/
wget https://raw.githubusercontent.com/RobSM90/instaladores/main/.mysqld_exporter.cnf
chown root:prometheus /etc/.mysqld_exporter.cnf
cd /etc/systemd/system
wget https://raw.githubusercontent.com/RobSM90/instaladores/main/mysqld_exporter.service
systemctl daemon-reload
systemctl enable mysqld_exporter
systemctl start mysqld_exporter
