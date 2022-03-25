#!/bin/bash

sudo curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo echo 'deb [arch=amd64] https://download.docker.com/linux/debian buster stable' | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt update -y
sudo apt remove docker docker-engine docker.io -y
sudo apt install docker-ce -y
sudo systemctl unmask docker.service
sudo systemctl unmask docker.socket
sudo systemctl start docker.service
sudo systemctl start docker
sudo systemctl enable docker
sudo docker run hello-world
