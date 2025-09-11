#!/bin/bash
#By Anggarda Saputra Wijaya
#Install NGINX & SSL
sudo apt-get update && sudo apt-get upgrade -y
sudo apt update && sudo apt install nginx certbot python3-certbot-nginx -y
sudo systemctl enable nginx
sudo systemctl start nginx
ufw allow 443
ufw allow 80
ufw allow 22
ufw enable
systemctl status ufw
