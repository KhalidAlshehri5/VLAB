#!/bin/bash
# Generate a new random password and update the VM password
NEW_PASSWORD=$(openssl rand -base64 12)
echo "$NEW_PASSWORD" > /root/vm_password.txt

# Update the VM password
az vm user update --name VLAB --resource-group VLAB_group --username azureuser --password "$NEW_PASSWORD"

