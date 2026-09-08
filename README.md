# NorthStar Azure Lab

## Enterprise Azure Infrastructure — AZ-104 Portfolio Project

![Azure](https://img.shields.io/badge/Microsoft%20Azure-0078D4?logo=microsoftazure\&logoColor=white)
![AZ-104](https://img.shields.io/badge/Certification-AZ--104-blue)
![Azure CLI](https://img.shields.io/badge/Azure%20CLI-0078D4?logo=azuredevops\&logoColor=white)
![Bicep](https://img.shields.io/badge/IaC-Bicep-purple)
![Networking](https://img.shields.io/badge/Focus-Azure%20Infrastructure-green)
![Status](https://img.shields.io/badge/Status-Complete-brightgreen)

---

## Project Overview

NorthStar Azure Lab is a hands-on Azure infrastructure project designed to demonstrate practical skills aligned with the **Microsoft Azure Administrator (AZ-104)** certification.

The project progressed from a basic Azure foundation into a functional infrastructure environment covering:

* Resource management
* Azure Virtual Networks
* Subnets
* Network Security Groups
* Virtual machines
* Azure Storage
* Microsoft Entra ID and RBAC
* Azure Policy
* Log Analytics
* Azure Monitor
* Alerts
* Backup
* Azure CLI
* PowerShell
* Bicep infrastructure as code
* Network troubleshooting
* Load Balancer troubleshooting
* Security and governance
* Technical documentation

The project follows an incremental infrastructure lifecycle:

```text
Design
  ↓
Build
  ↓
Configure
  ↓
Secure
  ↓
Monitor
  ↓
Automate
  ↓
Troubleshoot
  ↓
Validate
  ↓
Document
```

---

# 1. Project Objectives

The primary objective was to build and validate an Azure environment rather than simply complete isolated tutorials.

The project demonstrates the ability to:

1. Design an Azure infrastructure foundation.
2. Deploy and configure virtual networking.
3. Implement subnet-level network security.
4. Deploy and administer Azure compute resources.
5. Configure Azure storage.
6. Apply identity and access controls.
7. Implement governance through Azure Policy.
8. Configure centralized logging and monitoring.
9. Implement backup capabilities.
10. Administer resources through Azure CLI and PowerShell.
11. Define infrastructure through Bicep.
12. Troubleshoot network connectivity failures.
13. Validate configuration through Azure tooling.
14. Document infrastructure decisions and evidence.
15. Apply cost-conscious cloud engineering practices.

---

# 2. Environment Strategy

Because the project was developed using a limited Azure subscription, the environment deliberately separates **persistent infrastructure** from **temporary hands-on workloads**.

This avoids unnecessarily consuming Azure credits while still demonstrating the required Azure administration skills.

## Persistent NorthStar Environment

The permanent foundation contains:

| Resource        | Configuration        |
| --------------- | -------------------- |
| Resource Group  | `NorthStar-Azure-RG` |
| Region          | Canada Central       |
| Virtual Network | `NorthStar-VNet`     |
| Subnet          | `Websubnet`          |
| Subnet CIDR     | `10.0.1.0/24`        |
| NSG             | `NorthStar-Web-NSG`  |

The NorthStar environment represents the project's core Azure infrastructure foundation.

## Temporary Hands-On Environment

A separate Pluralsight lab was used for disposable compute and advanced networking exercises.

Resources included:

* `lab-vnet`
* `WebSubnet`
* `AppSubnet`
* `web-vm`
* `app-vm`
* `web-vm-nsg`
* `app-vm-nsg`

The temporary environment demonstrated:

* Azure VM deployment
* Linux administration
* Subnet segmentation
* NIC-level NSGs
* Subnet-level security
* Azure CLI
* Cloud Shell
* Network security rule evaluation
* Automation through Bash

Temporary public IP addresses and credentials are intentionally excluded from this repository.

---

# 3. NorthStar Network Architecture

The permanent NorthStar network uses a simple enterprise-style foundation.

```text
NorthStar-Azure-RG
└── NorthStar-VNet
    └── Websubnet
        └── NorthStar-Web-NSG
            ├── Allow HTTP  — TCP/80
            └── Allow HTTPS — TCP/443
```

### Network configuration

```text
VNet:        NorthStar-VNet
Address:     10.0.0.0/16

Subnet:      Websubnet
Address:     10.0.1.0/24

NSG:         NorthStar-Web-NSG

Inbound:
Priority 100 → Allow-HTTP  → TCP/80  → Allow
Priority 110 → Allow-HTTPS → TCP/443 → Allow
```

The NSG is associated with the `Websubnet`.

---

# 4. Compute Lab

The temporary compute environment demonstrated Azure virtual machine administration.

### Web VM

```text
Name:        web-vm
OS:          Ubuntu
Subnet:      WebSubnet
Private IP:  10.0.1.4
```

### Application VM

```text
Name:        app-vm
OS:          Ubuntu
Subnet:      AppSubnet
Private IP:  10.0.2.4
```

The VM exercise demonstrated:

* Linux VM deployment
* Virtual networking
* Private addressing
* Network Security Groups
* SSH access
* VM-to-VM networking concepts
* Azure CLI administration
* Infrastructure automation

Temporary public addressing was used only for the disposable lab and is not retained as project infrastructure.

---

# 5. Identity and Access Management

The project incorporated Azure identity and authorization concepts through Microsoft Entra ID and Azure RBAC.

Key concepts demonstrated:

* Microsoft Entra identities
* Azure role-based access control
* Scope-based permissions
* Least-privilege administration
* Separation of identity from infrastructure
* Administrative access management

The objective was to understand not only how to create resources, but also **who should be allowed to manage them and at what scope**.

---

# 6. Governance

Azure Policy was incorporated to demonstrate cloud governance.

Governance concepts included:

* Allowed resource regions
* Resource tagging
* Configuration compliance
* Policy evaluation
* Governance at Azure resource scopes

This establishes the transition from simply deploying infrastructure to controlling how infrastructure is deployed.

---

# 7. Storage

Azure Storage was incorporated into the project to demonstrate cloud storage administration.

The exercise covered the fundamentals of:

* Storage account configuration
* Azure storage services
* Access considerations
* Data protection concepts
* Cost-conscious storage usage

---

# 8. Monitoring and Logging

Centralized monitoring and logging were incorporated using Azure monitoring capabilities and Log Analytics.

The project covered:

* Log Analytics
* Log collection
* Monitoring
* Metrics
* Queries
* Alerts
* Operational visibility

The objective was to demonstrate the operational lifecycle after infrastructure deployment.

---

# 9. Backup

Backup capabilities were incorporated to demonstrate infrastructure protection and recovery concepts.

The project covered:

* Backup configuration
* Recovery considerations
* Protection of Azure workloads
* Operational recovery concepts

---

# 10. Azure CLI and PowerShell

Azure administration was performed using command-line tooling rather than relying exclusively on the Azure Portal.

Examples included:

```bash
az group list -o table
az network vnet list -o table
az vm list -o table
```

The project also incorporated PowerShell for Azure administration and automation concepts.

This demonstrates the ability to manage Azure environments through repeatable command-line workflows.

---

# 11. Infrastructure as Code — Bicep

Bicep was used to define the NorthStar infrastructure declaratively.

The Bicep implementation was validated through:

```bash
az bicep build
```

and:

```bash
az deployment group what-if
```

The final `what-if` validation showed **no changes required** for the represented VNet and NSG configuration.

This demonstrates that the infrastructure definition corresponds to the deployed Azure configuration.

---

# 12. Advanced Network Troubleshooting

A separate disposable Azure workload was created specifically to demonstrate structured troubleshooting.

The environment contained:

* Azure Load Balancer
* Frontend configuration
* Backend pool
* Linux web VM
* Network Security Group
* HTTP health probe
* HTTP load-balancing rule

## Initial failure

The Load Balancer initially reported unhealthy backend status and client HTTP requests timed out.

The troubleshooting process followed:

```text
Failure
  ↓
Investigation
  ↓
Root Cause
  ↓
Remediation
  ↓
Verification
```

## Investigation

Routing was examined first.

The effective route table showed:

```text
10.0.0.0/16 → VnetLocal
```

This demonstrated that the relevant virtual-network route existed and routing was not the primary cause of the failure.

The NSG was then examined.

The critical rules were:

```text
Priority 100 → DenyHTTPInbound → TCP/80 → Deny
Priority 200 → AllowHTTPInbound → TCP/80 → Allow
```

Azure NSGs evaluate lower numerical priorities first.

Therefore, the priority-100 deny rule prevented the priority-200 allow rule from being effective.

## Root cause

**The NSG explicitly denied inbound TCP/80 before the HTTP allow rule could be evaluated.**

## Remediation

The conflicting deny rule was removed.

The effective NSG configuration was then re-evaluated.

## Verification

After remediation:

```text
Load Balancer health:
0% → 100%

HTTP connectivity:
Timeout → HTTP 200

Backend:
Unreachable → Reachable
```

The web service successfully returned an HTTP 200 response.

This exercise demonstrates practical troubleshooting rather than simply configuring a successful environment from the beginning.

---

# 13. Security and Cost Controls

Security and cost management were treated as project requirements rather than afterthoughts.

### Security controls

* Network Security Groups
* Subnet segmentation
* RBAC
* Azure Policy
* Controlled administrative access
* Least-privilege concepts
* Removal of unnecessary access rules
* No credentials committed to GitHub

### Cost controls

* Small permanent infrastructure footprint
* Temporary resources for disposable exercises
* Pluralsight labs for expensive VM/network scenarios
* Temporary public IP usage only when required
* No unnecessary long-running compute resources
* Separation of learning workloads from persistent infrastructure

---

# 14. Evidence Philosophy

The repository documents capabilities demonstrated during the project without publishing sensitive infrastructure information.

The following are intentionally excluded:

* Passwords
* SSH credentials
* Secrets
* Subscription identifiers
* Temporary public IP addresses
* Temporary DNS names
* Authentication tokens
* Other sensitive environment information

The purpose of the repository is to demonstrate **technical capability and engineering methodology**, not expose a live Azure environment.

---

# 15. Completion Matrix

| #  | Project Requirement     | Status   | Evidence / Demonstration                    |
| -- | ----------------------- | -------- | ------------------------------------------- |
| 1  | Resource Groups         | Complete | `NorthStar-Azure-RG`                        |
| 2  | Virtual Network         | Complete | `NorthStar-VNet`                            |
| 3  | Subnets                 | Complete | `Websubnet`, temporary multi-subnet lab     |
| 4  | Network Security Groups | Complete | `NorthStar-Web-NSG`, VM-level NSGs          |
| 5  | Azure Storage           | Complete | Storage administration exercise             |
| 6  | Small VM                | Complete | Ubuntu VM hands-on lab                      |
| 7  | Entra ID / RBAC         | Complete | Identity and authorization exercises        |
| 8  | Azure Policy            | Complete | Governance/policy exercises                 |
| 9  | Log Analytics           | Complete | Centralized logging exercise                |
| 10 | Monitoring / Alerts     | Complete | Azure monitoring exercises                  |
| 11 | Backup                  | Complete | Azure workload protection exercise          |
| 12 | Azure CLI / PowerShell  | Complete | CLI and PowerShell administration           |
| 13 | Bicep                   | Complete | Build + `what-if` validation                |
| 14 | Architecture Diagram    | Complete | Mermaid architecture documentation          |
| 15 | GitHub Documentation    | Complete | README, documentation and project structure |

## Final Project Status

**PROJECT 1 — COMPLETE**

---

# 16. AZ-104 Skills Demonstrated

This project provides hands-on coverage across the major Azure Administrator skill areas.

### Manage Azure identities and governance

* Microsoft Entra ID
* RBAC
* Azure Policy
* Resource organization
* Governance

### Implement storage

* Azure Storage
* Storage configuration
* Data protection concepts

### Deploy and manage Azure compute resources

* Linux virtual machines
* VM networking
* Administrative access
* Temporary workload deployment

### Implement virtual networking

* VNets
* Subnets
* NSGs
* Private IP addressing
* Network segmentation
* Load Balancing
* Health probes
* Network troubleshooting

### Monitor and maintain Azure resources

* Azure Monitor
* Log Analytics
* Alerts
* Backup
* Operational troubleshooting

### Automation and Infrastructure as Code

* Azure CLI
* PowerShell
* Bicep
* Declarative infrastructure
* Deployment validation
* `what-if` analysis

---

# 17. Repository Structure

```text
northstar-azure-lab/
│
├── README.md
│
├── bicep/
│   ├── main.bicep
│   └── README.md
│
├── scripts/
│   ├── azure-cli/
│   ├── powershell/
│   └── bash/
│
├── docs/
│   ├── architecture.md
│   ├── troubleshooting.md
│   └── completion-matrix.md
│
├── evidence/
│   └── README.md
│
└── .gitignore
```

The exact filenames can be adjusted to match the final repository contents.

---

# 18. Engineering Methodology

NorthStar was intentionally built incrementally.

Rather than deploying a large environment in a single operation, the project progressed through individual Azure capabilities:

```text
Resource Group
      ↓
VNet
      ↓
Subnet
      ↓
NSG
      ↓
Storage
      ↓
Compute
      ↓
Identity / RBAC
      ↓
Policy
      ↓
Logging
      ↓
Monitoring
      ↓
Backup
      ↓
CLI / PowerShell
      ↓
Bicep
      ↓
Troubleshooting
      ↓
Documentation
```

This approach mirrors how Azure infrastructure is typically developed, validated and maintained.

---

# 19. Final Outcome

NorthStar Azure Lab successfully progressed from an empty Azure subscription to a validated Azure infrastructure environment.

The project demonstrates the ability to:

**Build the environment → secure it → operate it → automate it → troubleshoot it → document it.**

The project therefore serves as the foundation for the next stage of the Azure learning portfolio:

> **Project 2 — NorthStar Enterprise Identity & Security**

Project 1 establishes the infrastructure foundation. Project 2 will build upon that foundation by focusing more deeply on identity, secrets, managed identities, security posture, governance, private access and security monitoring.

---

## Project Status

**Complete — Azure Infrastructure Environment Built and Validated**
