#!/bin/bash -xe

sudo apt update
sudo snap install docker
sudo snap install docker-compose

sudo mkdir -p /home/ubuntu/compose_files

cat <<EOF > /home/ubuntu/compose_files/docker-compose.yml
version: '3'
services:
    nginx:
        image: nginx:latest
        container_name: nginx
        restart: always
        ports:
            - 80:80
            - 443:443
        volumes:
            - /home/ubuntu/nginx/conf.d:/etc/nginx/conf.d
EOF

# Perform a system upgrade if needed
sudo apt upgrade -y
