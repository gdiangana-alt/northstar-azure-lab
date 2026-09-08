#!/bin/bash

# NorthStar Azure Lab
# Resource Inventory Script
# Lists all resources deployed in the target resource group.

RESOURCE_GROUP="NorthStar-Azure-RG"

echo "========================================="
echo " NorthStar Azure Resource Inventory"
echo "========================================="
echo
echo "Resource Group: $RESOURCE_GROUP"
echo

az resource list \
  --resource-group "$RESOURCE_GROUP" \
  --output table
