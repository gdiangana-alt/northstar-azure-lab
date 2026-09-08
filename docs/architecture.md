# NorthStar Azure Lab — Architecture

## Permanent NorthStar Environment

```mermaid
flowchart TB
    Internet((Internet))

    subgraph Azure["Microsoft Azure — Canada Central"]
        RG["Resource Group<br/>NorthStar-Azure-RG"]

        subgraph VNET["NorthStar-VNet<br/>10.0.0.0/16"]
            SUBNET["Websubnet<br/>10.0.1.0/24"]
            NSG["NorthStar-Web-NSG<br/>HTTP 80 / HTTPS 443"]
        end

        RG --> VNET
        VNET --> SUBNET
        NSG --> SUBNET
    end

    Internet -->|HTTP / HTTPS| NSG
