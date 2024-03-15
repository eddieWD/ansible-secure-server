#!/bin/bash

apt update
apt upgrade -y

apt install git ansible
snap install --edge --classic just
