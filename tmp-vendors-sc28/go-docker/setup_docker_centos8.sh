#!/bin/bash

# Remove current installation if any
sudo dnf remove docker \
    docker-client \
    docker-client-latest \
    docker-common \
    docker-latest \
    docker-latest-logrotate \
    docker-logrotate \
    docker-engine

# Set up repository
sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# Install docker engine
sudo dnf install docker-ce docker-ce-cli containerd.io

## If want to install specific version of docker using the below commands
dnf list docker-ce --showduplicates | sort -r
# sudo dnf install docker-ce-<VERSION_STRING> docker-ce-cli-<VERSION_STRING> containerd.io
sudo dnf install docker-ce-20.10.9 docker-ce-cli-20.10.9 containerd.io

# Start docker
sudo systemctl start docker

# Verify that docker is installed correctly
sudo docker run hello-world

# Configure Docker to start on boot
sudo systemctl enable docker.service
sudo systemctl enable containerd.service

## To disable this behavior, use disable instead.
sudo systemctl disable docker.service
sudo systemctl disable containerd.service
