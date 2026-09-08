@description('Azure region for the NorthStar network resources.')
param location string = resourceGroup().location

@description('Name of the NorthStar virtual network.')
param vnetName string = 'NorthStar-VNet'

@description('Name of the web subnet.')
param webSubnetName string = 'Websubnet'

@description('Name of the Network Security Group.')
param nsgName string = 'NorthStar-Web-NSG'

resource webNsg 'Microsoft.Network/networkSecurityGroups@2023-11-01' = {
  name: nsgName
  location: location

  properties: {
    securityRules: [
      {
        name: 'Allow-HTTP'
        properties: {
          description: 'Allow inbound HTTP traffic'
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '80'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 100
          direction: 'Inbound'
        }
      }
      {
        name: 'Allow-HTTPS'
        properties: {
          description: 'Allow inbound HTTPS traffic'
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '443'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 110
          direction: 'Inbound'
        }
      }
    ]
  }
}

resource northStarVnet 'Microsoft.Network/virtualNetworks@2023-11-01' = {
  name: vnetName
  location: location

  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }

    subnets: [
      {
        name: webSubnetName
        properties: {
          addressPrefix: '10.0.1.0/24'
          networkSecurityGroup: {
            id: webNsg.id
          }
        }
      }
    ]
  }
}

output virtualNetworkName string = northStarVnet.name
output virtualNetworkAddressSpace string = '10.0.0.0/16'
output webSubnetName string = webSubnetName
output webSubnetAddressSpace string = '10.0.1.0/24'
output networkSecurityGroupName string = webNsg.name
