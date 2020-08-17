!#/bin/bash

# this provision script should be run on the controller vm (aws in our case)

sudo apt update

sudo apt install software-properties-common

sudo apt-add-repository --yes --update ppa:ansible/ansible

sudo apt-get install tree

sudo apt install ansible
