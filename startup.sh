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


# Define the location of the Caddyfile
caddyfile_path="/root"

# Create the Caddyfile content
cat << EOF >> "$caddyfile_path"
opus-web.com, www.opus-web.com {
        reverse_proxy localhost:8002
}

paperless.opus-web.com, www.paperless.opus-web.com {
        reverse_proxy localhost:8001
}
EOF

# Set ownership and permissions for the Caddyfile
chown root:caddy "$caddyfile_path"
chmod 777 "$caddyfile_path"  # Readable by owner and group, writable only by owner

echo "Caddyfile created successfully at $caddyfile_path"


# Caddy reload
systemctl reload caddy
caddy reload

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


# # GIT
# sudo apt update -y
# sudo apt-get install git -y

# Opus
# git clone https://github.com/uguazelli/opus.git


# Wordpress
cd /boxdigital/wp
docker compose up -d

# Paperless
cd /boxdigital/paperless
# docker compose run --rm webserver createsuperuser
docker compose up -d

# echo "instalation finished, please run 'docker compose up -d' to start"
