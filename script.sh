#!/bin/bash

az group create -n flask-app -l uksouth

az vm availability-set create -g flask-app -n flask-set -l uksouth --platform-fault-domain-count 2 --platform-update-domain-count 5

az vm create -g flask-app -n flask-server -l uksouth --image UbuntuLTS --availability-set flask-set --generate-ssh-keys --custom-data cloud-init.txt
