# Install prerequisites
sudo apt-get update
sudo apt-get install -y wget apt-transport-https gnupg lsb-release

# Import Trivy's GPG key (secure method)
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key \
    | gpg --dearmor \
    | sudo tee /usr/share/keyrings/trivy.gpg > /dev/null

# Add Trivy's repo with correct codename and signed-by
echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main" \
    | sudo tee /etc/apt/sources.list.d/trivy.list > /dev/null

# Update and install
sudo apt-get update
sudo apt-get install -y trivy
