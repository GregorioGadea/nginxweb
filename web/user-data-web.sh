#!/bin/bash -xe

sudo apt update
sudo snap install docker
sudo snap install docker-compose

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
            - ./nginx/conf.d:/etc/nginx/conf.d
EOF

sudo chown -R ubuntu:ubuntu /home/ubuntu/compose_files

# Perform a system upgrade if needed
sudo apt upgrade -y
