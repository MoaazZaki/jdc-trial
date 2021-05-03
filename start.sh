#!/bin/bash
sudo apt update
sudo snap install docker 
sudo apt install nginx
sudo docker login -u moaazzaki -p meZooZem1999
git clone https://MoaazZaki:meZooZem1999@github.com/MoaazZaki/jdc-trial.git
cd /etc/nginx/sites-enabled
sudo chmod 777 default
cp ~/jdc-trial/default default
cd
sudo nginx -s reload
cd jdc-trial
sudo docker-compose up
sudo docker update --restart unless-stopped $(sudo docker ps -q)