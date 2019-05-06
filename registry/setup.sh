#!/bin/sh
DOCKER_REGISTRY_IP=localhost
DOCKER_REGISTRY_PORT=443
DOCKER_REGISTRY_NAME=docker.registry

echo "$DOCKER_REGISTRY_IP $DOCKER_REGISTRY_NAME" | sudo tee --append /etc/hosts > /dev/null
sudo mkdir -p /etc/docker/certs.d/$DOCKER_REGISTRY_NAME:$DOCKER_REGISTRY_PORT/
sudo cp domain.crt /etc/docker/certs.d/$DOCKER_REGISTRY_NAME:$DOCKER_REGISTRY_PORT/client.crt

echo "docker/$DOCKER_REGISTRY_NAME.crt" | sudo tee --append /etc/ca-certificates.conf > /dev/null
sudo mkdir -p /usr/share/ca-certificates/docker
sudo ln -s /etc/docker/certs.d/$DOCKER_REGISTRY_NAME:$DOCKER_REGISTRY_PORT/client.crt /usr/share/ca-certificates/docker/$DOCKER_REGISTRY_NAME.crt
sudo restart docker