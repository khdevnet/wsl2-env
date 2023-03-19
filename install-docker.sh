#!/bin/sh
# curl -s https://raw.githubusercontent.com/khdevnet/wsl2-env/main/install-docker.sh | sh
# https://dev.solita.fi/2021/12/21/docker-on-wsl2-without-docker-desktop.html
# https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository

sudo apt remove docker docker-engine docker.io containerd runc

sudo apt-get update
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
 
sudo mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

sudo chmod a+r /etc/apt/keyrings/docker.gpg
sudo apt-get update

sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo groupadd docker
sudo usermod -aG docker $USER

# start automatically
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
