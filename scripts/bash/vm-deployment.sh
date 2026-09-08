#!/bin/bash

# NorthStar Azure Lab
# Temporary VM Deployment Automation
#
# Demonstrates automated Linux VM deployment using Azure CLI and Bash.
# Intended for a temporary lab environment to avoid unnecessary Azure costs.

set -e

RESOURCE_GROUP="NorthStar-Azure-RG"
LOCATION="canadacentral"
VNET_NAME="NorthStar-VNet"
SUBNET_NAME="Websubnet"
VM_NAME="NorthStar-Web-VM"
ADMIN_USERNAME="azureuser"

echo "========================================="
echo " NorthStar Temporary VM Deployment"
echo "========================================="

echo
echo "Deploying VM: $VM_NAME"

az vm create \
  --resource-group "$RESOURCE_GROUP" \
  --name "$VM_NAME" \
  --location "$LOCATION" \
  --image Ubuntu2204 \
  --size Standard_B1s \
  --admin-username "$ADMIN_USERNAME" \
  --generate-ssh-keys \
  --vnet-name "$VNET_NAME" \
  --subnet "$SUBNET_NAME"

echo
echo "VM deployment completed."

echo
echo "VM Information:"
az vm show \
  --resource-group "$RESOURCE_GROUP" \
  --name "$VM_NAME" \
  --show-details \
  --output table

echo
echo "IMPORTANT:"
echo "This VM is intended for temporary lab use."
echo "Delete the VM and associated billable resources when testing is complete."
