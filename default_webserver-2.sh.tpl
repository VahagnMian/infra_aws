#!/bin/bash

sudo apt update -y
sudo apt install nginx -y
sudo apt update -y


sudo systemctl start nginx

touch index.html
echo "<h1>THIS IS SERVER NUMBER: 2</h1>" > index.html
sudo rm /var/www/html/*
sudo mv index.html /var/www/html/
sudo systemctl restart nginx
