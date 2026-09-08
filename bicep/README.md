# Bicep Infrastructure as Code

This directory contains the Infrastructure as Code (IaC) configuration for the permanent NorthStar Azure environment.

## File

`main.bicep`

The Bicep template defines the core NorthStar network infrastructure.

## Resources Defined

### Virtual Network

- Name: `NorthStar-VNet`
- Address space: `10.0.0.0/16`
- Region: Canada Central

### Web Subnet

- Name: `Websubnet`
- Address prefix: `10.0.1.0/24`
- Associated with `NorthStar-Web-NSG`

### Network Security Group

- Name: `NorthStar-Web-NSG`

Inbound security rules:

| Priority | Rule | Protocol | Port | Action |
|---|---|---|---|---|
| 100 | Allow-HTTP | TCP | 80 | Allow |
| 110 | Allow-HTTPS | TCP | 443 | Allow |

## Deployment Scope

The template is designed for resource-group-level deployment into:

`NorthStar-Azure-RG`

Example deployment:

```bash
az deployment group create \
  --resource-group NorthStar-Azure-RG \
  --template-file main.bicep
```

## Validation

During the project, the Bicep template was:

1. Built and syntax-validated.
2. Compared against the existing Azure environment using Azure deployment `what-if`.
3. Confirmed to represent the deployed NorthStar network configuration without requiring infrastructure changes.

## Purpose

Using Bicep demonstrates the ability to move from manually configured Azure resources to a reproducible Infrastructure as Code model.

This provides:

- Repeatable deployments
- Version-controlled infrastructure
- Consistent network configuration
- Easier change review
- Reduced configuration drift
- Reusable Azure deployment definitions

## Security

The Bicep template contains no credentials, secrets, subscription IDs, or other sensitive account information.
