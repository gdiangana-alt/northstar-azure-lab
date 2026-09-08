#!/bin/bash

# NorthStar Azure Lab
# Virtual Machine Inventory Script
# Lists virtual machines and basic VM configuration in the target resource group.

RESOURCE_GROUP="NorthStar-Azure-RG"

echo "========================================="
echo " NorthStar Azure VM Inventory"
echo "========================================="
echo
echo "Resource Group: $RESOURCE_GROUP"
echo

echo "Virtual Machines"
az vm list \
  --resource-group "$RESOURCE_GROUP" \
  --show-details \
  --output table
