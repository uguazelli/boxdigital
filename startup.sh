#!/usr/bin/env bash

# Add the Caddy repository:

curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo apt-key add -
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee -a /etc/apt/sources.list.d/caddy-stable.list
sudo apt update

# Install caddy
sudo apt install caddy

# Caddy will automatically start after installation. You can enable it to start on boot with:
sudo systemctl enable caddy

# Verify Installation:
sudo systemctl status caddy

# DOCKER 
curl -fsSL get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# DOCKER COMPOSE
sudo apt-get install docker-compose-plugin -y


# GIT
sudo apt update -y
sudo apt-get install git -y


# Wordpress
docker compose -f wp-docker-compose.yml up -d

# Paperless
git clone https://github.com/uguazelli/opus.git
cd opus

docker compose run --rm webserver createsuperuser



echo "instalation finished, please run 'docker compose up -d' to start"