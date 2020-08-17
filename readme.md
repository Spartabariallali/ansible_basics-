### Infrastructure as Code IaC
- IaC is used to speed up the process of configuration management or orchestration
#### Ansible
- Infrastructure automation tool for configuration management
- Connects via ssh

#### Advantages of Ansible
Ansible doesn’t use agents, and its code is written in YAML in the form of Ansible Playbooks, so configurations are very easy to understand and deploy.

- simple
- Agentless
- IT automation

#### Practical example
- create 3 instances
- One Ansible controller instance - that will dictate the configuration of the two other instances in our network
The controller virtual machine is the vm that has Ansible installed on it and the other instances do not require Ansible to be downloaded on them (Agentless)

Ubuntu 16.04 vm - webApp
Ubuntu 16.04 vm - db

### creating controller 
we want to install ansible on the aws virtual machine we have created using the vagrantfile
look at the system of ansible 
how to create host entries tell the controller which ips to communicate with 

### installing ansible on controller 
- ssh into aws virtual machine 
- sudo apt-get install software-properties-common -y
- sudo apt-get update
	sudo apt-get install software-properties-common
	sudo apt-add-repository ppa:ansible/ansible
	sudo apt-get update
	sudo apt-get install ansible
sudo apt-get install tree

cd etc/ansible - default location for files 

ansible "name of vm" -m ping - code to communicate to other vms 

192.168.33.10 - web
192/168.33.11 - db 

[web]
192.168.33.10 ansible_connection=ssh ansible_ssh_user=vagrant ansible_ssh_pass=vagrant
[db]
192.168.33.11 ansible_connection=ssh ansible_ssh_user=vagrant ansible_ssh_pass=vagrant
[aws]
192.168.33.12 ansible_connection=ssh ansible_ssh_user=vagrant ansible_ssh_pass=vagrant


this how we connect the controller to the vms 

to ssh into the vms 
ssh vagrant@192.168.33.10

ping machines with ansible command

# Instructions 

1) First run the following up to run all the machines


vagrant up 


2) Enter each VM update the packages:


vagrant ssh db
sudo apt-get update
exit

# repeat steps but with app and aws 
vagrant ssh app 
vagrant ssh aws 


3) Enter the AWS and run this



sudo apt-get install software-properties-common -y
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get install ansible -y # install ansible 
sudo apt-get install tree


4) Enter /etc/ansible folder


cd /etc/ansible tree 
### ansible.cfg, hosts and roles should appear
 

5) test no connected to app and 


ping 192.168.33.11
ping 192.168.33.10 # testing connection with Db and app


6) Create Host entries 


cd ../../etc/ansible 
sudo nano hosts

# copy the following inside hosts
[web]
192.168.33.10 ansible_connection=ssh ansible_ssh_user=vagrant ansible_ssh_pass=vagrant

[db]
192.168.33.11 ansible_connection=ssh ansible_ssh_user=vagrant ansible_ssh_pass=vagrant




7) vagrant ssh into the other vm


ssh vagrant@192.168.33.10
ssh vagrant@192.168.33.11

# you will be asked to add a new ECDSA fingerprint. Password is vagrant 
# After adding these new fingerprints, sudo apt-get update
sudo apt-get update 



8) ping the connections back in aws controller

ansible all -m ping
