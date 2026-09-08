# Azure Network Troubleshooting Case Study

## Overview

This troubleshooting exercise demonstrates a structured investigation of an Azure workload that was unreachable through an Azure Load Balancer.

The objective was to identify the source of the connectivity failure, remediate the issue, and verify that the application became reachable.

## Environment

The temporary troubleshooting environment included:

- Azure Virtual Network
- Linux Web VM
- Network Interface
- Network Security Group
- Azure Load Balancer
- Load Balancer frontend configuration
- Backend pool
- HTTP health probe
- TCP/80 load-balancing rule

## Initial Problem

HTTP requests sent through the Azure Load Balancer timed out.

The Load Balancer reported:

- Backend health: **0%**
- HTTP connectivity: **Failed**
- Web server: **Unreachable through the Load Balancer**

This indicated that traffic was not successfully reaching the backend web workload.

## Investigation

### 1. Resource Validation

Azure CLI was used to inventory the deployed resources and confirm the components involved in the traffic path.

### 2. Load Balancer Configuration

The Load Balancer configuration was reviewed.

The environment contained:

- Frontend configuration
- Backend pool
- HTTP health probe
- TCP/80 load-balancing rule

The backend VM was correctly associated with the Load Balancer backend pool.

### 3. Route Analysis

The effective route table was inspected.

The relevant route showed:

`10.0.0.0/16 → VnetLocal`

This confirmed that traffic within the virtual network had a valid local route.

Routing was therefore eliminated as the primary cause of the failure.

### 4. NSG Analysis

The Network Security Group rules were then inspected.

Two custom inbound rules affected TCP port 80:

| Priority | Rule | Port | Action |
|---|---|---|---|
| 100 | DenyHTTPInbound | TCP/80 | Deny |
| 200 | AllowHTTPInbound | TCP/80 | Allow |

Azure NSG rules are evaluated by priority, with lower priority numbers processed first.

Therefore, the priority **100 DenyHTTPInbound** rule was evaluated before the priority **200 AllowHTTPInbound** rule.

The deny rule prevented HTTP traffic from reaching the backend workload.

## Root Cause

The connectivity failure was caused by an incorrectly prioritized Network Security Group rule:

`DenyHTTPInbound — Priority 100 — TCP/80 — Deny`

Because this rule had a higher evaluation priority than the HTTP allow rule, inbound HTTP traffic was blocked.

## Remediation

The blocking NSG rule was removed using Azure CLI:

```bash
az network nsg rule delete \
  --resource-group $RG \
  --nsg-name globomantics-web-nsg \
  --name DenyHTTPInbound
```

After the rule was removed, the effective NSG configuration no longer contained the explicit TCP/80 deny rule.

## Verification

The workload was tested again after remediation.

Results:

| Test | Before | After |
|---|---|---|
| Load Balancer backend health | 0% | 100% |
| HTTP request | Timeout | HTTP 200 |
| TCP/80 blocking rule | Present | Removed |
| Backend workload | Unreachable | Reachable |

The final HTTP request successfully returned:

`HTTP 200`

from the Linux nginx web server.

This confirmed that the NSG rule was the root cause and that the remediation restored connectivity.

## Troubleshooting Methodology

The investigation followed a repeatable troubleshooting process:

**Failure → Investigation → Root Cause → Remediation → Verification**

This approach avoided making assumptions and progressively eliminated potential causes.

## Skills Demonstrated

- Azure Load Balancer troubleshooting
- Network Security Group analysis
- NSG priority evaluation
- Effective route analysis
- Backend health investigation
- Azure CLI troubleshooting
- Linux web workload validation
- Root-cause analysis
- Connectivity verification
- Azure network remediation

## Security

Public IP addresses, subscription identifiers, credentials, and other sensitive deployment information have intentionally been excluded from this documentation.
