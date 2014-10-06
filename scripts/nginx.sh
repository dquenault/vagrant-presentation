#!/bin/bash

echo "Installing nginx"
sudo cp /home/vagrant/nginx.repo /etc/yum.repos.d/nginx.repo
sudo yum install git -y
sudo yum install nginx -y

echo "Getting site from github"
##echo -e "Host github.com\n\tStrictHostKeyChecking no\n" > ~/.ssh/config
if [ ! -d "/home/vagrant/impress-vagrant" ] 
then
  sudo git clone https://github.com/dquenault/impress-vagrant.git 
fi

echo "Copy files to static serve directory"
if [ ! -d "/data" ]
then
	sudo mkdir /data
	sudo mkdir /data/www
fi

sudo cp -r /home/vagrant/impress-vagrant /data/www
sudo chmod 755 /home/vagrant/impress-vagrant

# Remove firewall restrictions
sudo service iptables stop

