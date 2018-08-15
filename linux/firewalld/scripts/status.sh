#!/usr/bin/env bash

firewall-cmd --get-default-zone
firewall-cmd --get-active-zones
firewall-cmd --get-zones
sudo firewall-cmd --list-all
sudo firewall-cmd --get-services
sudo firewall-cmd --zone=public --list-ports
sudo iptables -L
