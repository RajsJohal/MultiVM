#!/bin/bash

#update, upgrade, install nginx
sudo apt-get update -y

sudo apt-get upgrade -y

# Adding  MongoDB Repo
wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -

echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list

sudo apt-get update

# Install and Verify MongoDB

sudo apt-get install -y mongodb-org

sudo systemctl start mongod

sudo systemctl enable mongod

#change bindIP inside mongod.conf
# sudo rm -rf /etc/mongod.conf
sudo cp /home/vagrant/db/mongod.conf /etc/mongod.conf

sudo systemctl restart mongod
sudo systemctl enable mongod


