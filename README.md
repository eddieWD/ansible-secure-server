# Configuring WD server on Digital Ocean droplet

## Overview
We created a Digital Ocean cloud server to host a tailscale exit node. THis project leverages ansible to automatically configure and secure the server.

## Server Deployment
1. login to the WD digital ocean account
2. create new droplet using Ubuntu 22.04 LTS as the OS
3. login to the web console as root
    a. Digital Ocean will email you the inital root password
    b. on first login you will be forced to change it
4. update the server
    `apt update`
    `apt upgrade -y`
5. install git
    `apt install -y git`
6. pull down the git repo from bitbucket
    `git clone https://github.com/eddieWD/ansible-secure-server.git`
7. change to the repo directory
    `cd ansible-secure-server`
8. change permissions on the bootstrap script
    `chmod +x bootstrap.sh`
9. run the bootstrap script
    `./bootstrap.sh`
10. during the script you will be prompted to enter some information


## Ansible tasks explaination
1. update the package cache and OS
2. add wdadmin user
    1. create home dir
    2. setup password
    3. add provided ssh public key for wdadmin
3. secure the server with ansible roles
    1. enable auto updating security packages   
        1. email it@wd.cpa about errors updating
    2. secure ssh server
        1. change ssh port to 2202
    3. set ntp timezone (America/Chicago.
    4. enable firewall
        1. allow port 2202 for ssh
        2. block everything else
    5. enable and config fail2ban to dynamically block logins over ssh

