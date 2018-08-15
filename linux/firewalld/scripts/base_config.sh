$!/usr/bin/env bash

sudo firewall-cmd --state
sudo firewall-cmd --zone=public --permanent --add-service=ssh
sudo firewall-cmd --zone=public --permanent --add-service=puppetmaster
sudo firewall-cmd --zone-public --permanent --add-service=http
sudo firewall-cmd --zone-public --permanent --add-service=https
sudo firewall-cmd --zone-public --permanent --add-port=5000/tcp

