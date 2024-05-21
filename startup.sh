#!/usr/bin/env bash


# Install caddy
sudo apt install -y debian-keyring debian-archive-keyring apt-transport-https curl
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list
sudo apt update
sudo apt install caddy

# Caddy will automatically start after installation. You can enable it to start on boot with:
sudo systemctl enable caddy

# Verify Installation:
sudo systemctl status caddy

# Caddy reload
systemctl reload caddy


# Caddy file example  filename: Caddyfile

# opus-web.com, www.opus-web.com {
#         reverse_proxy localhost:8002
# }

# paperless.opus-web.com, www.paperless.opus-web.com {
#         reverse_proxy localhost:8001
# }


# ##########################


# DOCKER 
curl -fsSL get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# DOCKER COMPOSE
sudo apt-get install docker-compose-plugin -y


# GIT
sudo apt update -y
sudo apt-get install git -y

# Opus
git clone https://github.com/uguazelli/opus.git


# Wordpress
cd opus/wp
docker compose up -d

# Paperless
cd /opus/paperless
docker compose run --rm webserver createsuperuser

echo "instalation finished, please run 'docker compose up -d' to start"
