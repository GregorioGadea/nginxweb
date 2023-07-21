#!/bin/bash -xe

sudo apt update

sudo snap install docker # install docker and docker-compose
sudo snap install docker-compose

sudo su -

cat <<"EOF" > /home/ubuntu/compose_files/docker-compose.yml

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

apt upgrade -y # upgrade any packages available
