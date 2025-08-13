#!/bin/bash

echo "Enter the grafana version to install, the version should be exactly as shown on the website:"
read  version
sudo apt update -y && sudo apt upgrade -y
wget https://dl.grafana.com/enterprise/release/grafana-enterprise_${version}_amd64.deb
sudo apt install -y libfontconfig1
sudo dpkg -i grafana-enterprise_${version}_amd64.deb
sudo apt install -f -y

#Add grafana to start on reboot
sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable grafana-server

#Start grafana service
sudo systemctl start grafana-server
ss -ant | grep 3000
