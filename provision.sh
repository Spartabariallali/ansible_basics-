#!/bin/bash

# this provision script should be run on the controller vm (aws in our case)

sudo apt update -y

sudo apt install software-properties-common -y

sudo apt-add-repository --yes --update ppa:ansible/ansible

sudo apt-get install tree -y

sudo apt install ansible -y 
