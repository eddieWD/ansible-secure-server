#!/bin/bash

apt update

apt install git ansible
snap install --edge --classic just

just reqs
just main
