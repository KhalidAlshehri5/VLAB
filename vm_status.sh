#!/bin/bash
# Check the VM status and output to stdout
az vm get-instance-view --name VLAB --resource-group VLAB_group --query "instanceView.statuses[?starts_with(code,'PowerState/')].displayStatus" -o tsv
