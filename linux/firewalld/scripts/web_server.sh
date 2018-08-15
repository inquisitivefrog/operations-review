$!/usr/bin/env bash

sudo firewall-cmd --state
sudo firewall-cmd --zone-public --permanent --add-service=http
sudo firewall-cmd --zone-public --permanent --add-service=https

