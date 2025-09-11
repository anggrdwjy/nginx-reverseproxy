#!/bin/bash
#By Anggarda Saputra Wijaya
#custom domain NGINX with SSL
echo "                                                    ";
echo "   ==============================================   ";
echo "              Generate Domain with SSL              ";
echo "   ==============================================   ";
echo "                                                    ";
echo -n "   Add DOMAIN    : "
read DOMAIN
echo -n "   HTTP / HTTPS  : "
read HTTP
echo -n "   POINTING IP   : "
read POINTING_IP
echo -n "   POINTING PORT : "
read POINTING_PORT
echo "                                                    ";
echo "   ==============================================   ";
echo "                                                    ";
sudo cp support/domain /etc/nginx/sites-available/$DOMAIN
sed -i "s/domain/$DOMAIN/g" /etc/nginx/sites-available/$DOMAIN
sed -i "s/http/$HTTP/g" /etc/nginx/sites-available/$DOMAIN
sed -i "s/localhost/$POINTING_IP/g" /etc/nginx/sites-available/$DOMAIN
sed -i "s/port/$POINTING_PORT/g" /etc/nginx/sites-available/$DOMAIN
sudo ln -s /etc/nginx/sites-available/$DOMAIN /etc/nginx/sites-enabled/
sudo systemctl restart nginx
sudo certbot --nginx -d $DOMAIN
