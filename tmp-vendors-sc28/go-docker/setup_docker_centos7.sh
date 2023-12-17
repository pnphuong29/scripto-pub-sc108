#!/bin/bash

# Remove current installation if any
sudo yum remove docker \
    docker-client \
    docker-client-latest \
    docker-common \
    docker-latest \
    docker-latest-logrotate \
    docker-logrotate \
    docker-engine

# Set up repository
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# Install docker engine
sudo yum install docker-ce docker-ce-cli containerd.io

## If want to install specific version of docker using the below commands
yum list docker-ce --showduplicates | sort -r
sudo yum install docker-ce-<VERSION_STRING> docker-ce-cli-<VERSION_STRING> containerd.io

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
