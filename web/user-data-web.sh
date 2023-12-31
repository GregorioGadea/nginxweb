#!/bin/bash -xe

sudo apt update -y

cd /home/ubuntu

sudo mkdir /home/ubuntu/compose_files

sudo snap install docker
sleep 10 # wait for docker to start

sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sleep 10 # wait for docker-compose to download

sudo chmod +x /usr/local/bin/docker-compose

sudo cat <<"EOF" > /home/ubuntu/compose_files/docker-compose.yml
version: '3'
services:
    nginx:
        image: nginx:latest
        container_name: nginx
        restart: always
        ports:
            - 80:80
            - 443:443
EOF

# ---- Run docker-compose ----
cd /home/ubuntu/compose_files
sudo docker-compose up -d

cd /home/ubuntu

#sudo usermod -aG docker $USER
#sudo newgrp docker

cat <<"EOF" > /home/ubuntu/done.txt
Done!
EOF
