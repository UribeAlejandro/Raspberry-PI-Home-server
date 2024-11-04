#!/bin/bash

# More info on the Docker installation can be found at https://docs.docker.com/engine/install/debian/
echo "Updating the package list" && \
sudo apt-get update && \
sudo apt-get install -y \
  git \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg2 \
  software-properties-common \
  nano \
  fail2ban \
  ntfs-3g \
&& \
echo "Adding Docker GPG key" && \

curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc && \
sudo chmod a+r /etc/apt/keyrings/docker.asc && \
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null &&\

echo "Installing Docker packages" && \
sudo apt-get update && \
sudo apt-get install -y --no-install-recommends docker-ce docker-compose && \

echo "Adding the current user to the docker group" && \
sudo usermod -a -G docker '$USER' && \

echo "Rebooting the system" && \
sleep 3 && \
sudo reboot
