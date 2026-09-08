#!/bin/bash

# NorthStar Azure Lab
# Network Inventory Script
# Displays the VNet, subnet, and NSG configuration.

RESOURCE_GROUP="NorthStar-Azure-RG"
VNET_NAME="NorthStar-VNet"
NSG_NAME="NorthStar-Web-NSG"

echo "========================================="
echo " NorthStar Azure Network Inventory"
echo "========================================="
echo

echo "Virtual Network"
az network vnet show \
  --resource-group "$RESOURCE_GROUP" \
  --name "$VNET_NAME" \
  --output table

echo
echo "Subnets"
az network vnet subnet list \
  --resource-group "$RESOURCE_GROUP" \
  --vnet-name "$VNET_NAME" \
  --output table

echo
echo "Network Security Group"
az network nsg show \
  --resource-group "$RESOURCE_GROUP" \
  --name "$NSG_NAME" \
  --output table

echo
echo "NSG Rules"
az network nsg rule list \
  --resource-group "$RESOURCE_GROUP" \
  --nsg-name "$NSG_NAME" \
  --output table
