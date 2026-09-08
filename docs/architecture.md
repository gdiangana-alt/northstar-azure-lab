```mermaid
flowchart TB
    INTERNET(("Internet"))

    subgraph RG["Resource Group: NorthStar-Azure-RG"]
        direction TB

        NSG["NorthStar-Web-NSG<br/>Inbound Rules<br/>TCP 80 — HTTP<br/>TCP 443 — HTTPS"]

        subgraph VNET["NorthStar-VNet | 10.0.0.0/16"]
            direction TB

            SUBNET["Websubnet<br/>10.0.1.0/24"]
        end

        NSG -->|"Associated with Websubnet"| SUBNET
    end

    INTERNET -->|"HTTP / HTTPS"| NSG
```
