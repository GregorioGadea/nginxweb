sudo apt update

sudo apt install -y docker.io docker-compose # install docker and docker-compose

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
