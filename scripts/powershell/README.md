# PowerShell — NorthStar Azure Lab

This directory documents PowerShell administration used as part of the NorthStar Azure Lab.

PowerShell provides an alternative administrative interface to Azure CLI for inspecting and managing Azure resources.

## Example — Resource Group Inventory

```powershell
$ResourceGroup = "NorthStar-Azure-RG"

Get-AzResource `
    -ResourceGroupName $ResourceGroup |
    Format-Table Name, ResourceType, Location
```

## Example — Virtual Network

```powershell
$ResourceGroup = "NorthStar-Azure-RG"
$VNetName = "NorthStar-VNet"

Get-AzVirtualNetwork `
    -ResourceGroupName $ResourceGroup `
    -Name $VNetName
```

## Example — Network Security Group

```powershell
$ResourceGroup = "NorthStar-Azure-RG"
$NSGName = "NorthStar-Web-NSG"

Get-AzNetworkSecurityGroup `
    -ResourceGroupName $ResourceGroup `
    -Name $NSGName
```

## Example — NSG Security Rules

```powershell
$nsg = Get-AzNetworkSecurityGroup `
    -ResourceGroupName "NorthStar-Azure-RG" `
    -Name "NorthStar-Web-NSG"

$nsg.SecurityRules |
    Select-Object Name, Priority, Direction, Access, Protocol,
        DestinationPortRange |
    Format-Table
```

## Skills Demonstrated

- Azure administration with PowerShell
- Resource inventory
- Virtual network inspection
- Network Security Group inspection
- Security rule analysis
- PowerShell object handling
- Azure resource troubleshooting

## Security

No credentials, secrets, subscription IDs, access tokens, or other sensitive information are stored in these examples.
