#!/bin/bash
echo "Stopping Grafana service..."
sudo systemctl stop grafana-server 2>/dev/null
sudo systemctl disable grafana-server 2>/dev/null

echo "Removing Grafana Enterprise package..."
sudo dpkg --purge grafana-enterprise 2>/dev/null

echo "Deleting leftover directories..."
sudo rm -rf /etc/grafana
sudo rm -rf /var/lib/grafana
sudo rm -rf /var/log/grafana
sudo rm -rf /usr/share/grafana

echo "Cleaning up systemd service..."
sudo rm -f /etc/systemd/system/grafana-server.service
sudo systemctl daemon-reload

echo "Verifying removal..."
dpkg -l | grep grafana || echo "Grafana package not found."
sudo ss -lntp | grep 3000 || echo "No process is listening on port 3000."

echo "Grafana Enterprise removal complete!"
