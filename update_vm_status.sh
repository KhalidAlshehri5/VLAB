#!/bin/bash
# Update VM status and password

# Fetch VM power status
status=$(az vm get-instance-view --name VLAB --resource-group VLAB_group --query "instanceView.statuses[?starts_with(code, 'PowerState/')].displayStatus" -o tsv)
echo "$status" > /root/vm_status.txt

# Update password
./update_vm_password.sh
