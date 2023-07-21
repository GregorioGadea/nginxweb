#!/bin/bash -xe

sudo apt update -y

cd /home/ubuntu

sudo mkdir /home/ubuntu/compose_files

sudo snap install docker
sleep 10 # wait for docker to start
#sudo snap install docker-compose
#sleep 10 # wait for docker-compose to start
sudo chmod +x /usr/local/bin/docker-compose 
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
sudo systemctl start docker

sleep 5
sudo su - # switch to root user

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
            - /home/ubuntu/nginx/conf.d:/etc/nginx/conf.d
EOF

# ---- Run docker-compose ----
sudo chmod +x /home/ubuntu/compose_files/docker-compose.yml
cd /home/ubuntu/compose_files
sudo docker-compose up -d

cd /home/ubuntu

#sudo usermod -aG docker $USER
#sudo newgrp docker

cat <<"EOF" > /home/ubuntu/done.txt
Done!
EOF
