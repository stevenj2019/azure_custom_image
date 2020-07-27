#!/bin/bash

az group create -n flask-app -l uksouth --output none

az vm availability-set create -g flask-app -n flask-set -l uksouth --platform-fault-domain-count 2 --platform-update-domain-count 5 --output none

az vm create -g flask-app -n flask-server -l uksouth --image UbuntuLTS --availability-set flask-set --generate-ssh-keys --custom-data cloud-init.txt --output none

az vm open-port --resource-group flask-app --name flask-server --port 5000 --output none

echo web address: http:// ${az network public-ip show --resource-group flask-app --name flask-server}:5000
echo "SSH: ssh ${az network public-ip show --resource-group flask-app --name flask-server}"
