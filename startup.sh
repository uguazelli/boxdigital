#!/usr/bin/env bash

# NGINX
sudo apt update -y
sudo apt install ufw -y
sudo apt install nginx -y

sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw allow 22
sudo ufw enable
sudo ufw allow http
sudo ufw allow https
sudo ufw status verbose
sudo systemctl restart nginx

#sudo nano /etc/default/ufw
#Locate IPV6 in the file and ensure the value is yes:
#IPV6=yes
#Checking your Web Server
#systemctl status nginx
#ip addr show eth0 | grep inet | awk '{ print $2; }' | sed 's/\/.*$//'
#You will get back a few lines. You can try each in your web browser to see if they work.
#Restart Nginx: After making  changes, restart Nginx for the changes to take effect.

# GIT
sudo apt update -y
sudo apt-get install git -y

# Paperless
git clone https://github.com/uguazelli/opus.git
cd opus

# Wordpress
docker compose -f wp-docker-compose.yml up -d

# DOCKER 
curl -fsSL get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# DOCKER COMPOSE
sudo apt-get install docker-compose-plugin -y
docker compose run --rm webserver createsuperuser


echo "instalation finished, please run 'docker compose up -d' to start"