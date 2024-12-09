#!/bin/bash
VM_NAME="VLAB" # اسم الـ VM
RESOURCE_GROUP="VLAB_group" # اسم مجموعة الموارد

if [ "$1" == "start" ]; then
    az vm start --resource-group $RESOURCE_GROUP --name $VM_NAME
elif [ "$1" == "stop" ]; then
    az vm deallocate --resource-group $RESOURCE_GROUP --name $VM_NAME
else
    echo "Usage: $0 {start|stop}"
fi
