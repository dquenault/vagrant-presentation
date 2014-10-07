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
sudo iptables -F
sudo iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
sudo iptables -A INPUT -p tcp -m tcp --dport 8080 -j ACCEPT
sudo iptables -A INPUT -p tcp -m tcp --dport 22 -j ACCEPT
sudo iptables-save | sudo tee /etc/sysconfig/iptables
sudo service iptables restart

