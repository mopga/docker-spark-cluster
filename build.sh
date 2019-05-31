#!/bin/bash

# ADD HOSTS FOR THE DOCKER CLUSTER NETWORK
sudo bash -c "cat docker_cluster_hosts >> /etc/hosts"

# BUILD IMAGES
sudo docker-compose build


