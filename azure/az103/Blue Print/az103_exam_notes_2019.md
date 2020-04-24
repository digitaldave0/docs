## AZ-103 Exam Notes

[Azure az-103 study notes]("https://thomasthornton.cloud/2019/05/07/microsoft-azure-exam-az-103-study-notes/")

AZ-103 is the newest Azure administrator exam, consisting of both the previous exams AZ-100 and AZ-101. The exam measures your ability in a number of areas including:- Azure Storage, virtual machines, virtual networks and managed identities.

Exam topics covered:-

Manage Azure subscriptions and resources (15-20%)
Implement and manage storage (15-20%)
Deploy and manage virtual machines (VMs) (15-20%)
Configure and manage virtual networks (30-35%)
Manage identities (15-20%)

A broad range of topics above, later in my blog I will include a list of study notes I used to prepare in each area including additional links that I think will be relevant.

Knowing the topics is one thing, knowing how to apply them in specific scenarios is another! Unfamiliar with a specific topic or area? I recommend deploying each resource into Azure, view the settings and look at why they may be deployed over a similar resource. Read my blog on Microsoft Azure:- Exam Preparation Tips

A general understanding of the following areas is highly recommended:

Azure Portal
AzureCLI
Powershell
ARM Templates
Hyper-V & Virtualisation on-premise configurations
Networking
VPN
Study Notes

Manage Azure subscriptions and resources (15-20%)

+ Manage Azure subscriptions [Manage Azure subscriptions]("https://docs.microsoft.com/en-us/azure/billing")
+ Add Or Change Azure Subscription Administrators [Add Or Change Azure Subscription Administrators]("https://docs.microsoft.com/en-us/azure/active-directory/users-groups-roles/directory-assign-admin-roles")
+ Administrator Role Permissions In Azure Active Directory [Administrator role permissions in Azure Active Directory]("https://docs.microsoft.com/en-us/azure/active-directory/users-groups-roles/directory-assign-admin-roles")
+ Azure Subscription And Service Limits, Quotas, And Constraints [Azure subscription and service limits, quotas, and constraints]("https://docs.microsoft.com/en-us/azure/azure-subscription-service-limits")
+ Prevent Unexpected Charges With Azure Billing And Cost Management [Prevent unexpected charges with Azure billing and cost management]("https://docs.microsoft.com/en-us/azure/billing/billing-getting-started")
+ Configure Cost Centre Quotas And Tagging [Configure cost center quotas and tagging]("https://www.linkedin.com/learning/azure-administration-manage-subscriptions-and-resources/configure-cost-center-quotas-and-tagging")
+ Azure Resource Tags [Overview of the Azure Policy service]("https://docs.microsoft.com/en-us/azure/governance/policy/overview")

+ Overview Of Azure Policy
+ Create And Manage Policies To Enforce Compliance

Analyze resource utilization and consumption

+ Azure Diagnostic Logs Overview
+ Step-by-Step:- Enable Diagnostic Logs On Virtual Machine
+ Configure Diagnostic Settings On Azure Resources In Portal
+ What Is Baseline Protection?
+ Creating A Baseline For Resources
+ Metric Alerts With Dynamic Thresholds In Azure Monitor 
+ Collect & Consume Log Data From Your Azure Resources
Enable Diagnostic Settings Using ARM
Monitoring Data Collected By Azure Monitor
Monitor Subscription Activity With The Azure Activity Log
Collect Data About Azure Virtual Machines
View Service Notifications
Azure Advisor 
Download Or View Your Azure Billing Invoice And Daily Usage Data 
Explore And Analyze Costs With Cost Analysis 
Cloudyn
Prevent Unexpected Charges With Azure Billing And Cost Management
Functions in Log Queries
Alerting On Log Analytics Data 
Viewing And Analysing Data In Log Analytics 
Analyse Log data in Azure Monitor
Setup Spending Limit
Ways To Monitor Your Costs Including Resource Tagging
Reducing Cost Including Monitoring For Unused Resources

Manage resource groups
Azure Policy
Lock Resources To Prevent Unexpected Changes 
Create And Manage Policies To Enforce Compliance 
Azure Logging And Auditing
View Activity Logs To Audit Actions On Resources 
Audit logs in Azure Portal
Move Resources To New Resource Group Or Subscription 
Removing A Resource Group In Azure

Managed role based access control (RBAC)
What Is Role-Based Access Control (RBAC) For Azure Resources? 
Manage Access To Azure Resources Using RBAC And The Azure Portal
RBAC For Azure Resources
Understand RBAC Roles
View Roles Per User
Grant Access For A User – Azure Portal
Conditional Access For Azure Management
Custom Roles 

Implement and manage storage (15-20%)
Create and configure storage accounts
Configure Azure Storage Firewalls And Virtual Networks 
Virtual Network Service Endpoints and Firewalls for Azure Storage now Generally Available 
Azure Storage Security Guide 
Create An Azure Storage Account
Using Shared Access Signatures (SAS) 
Delegating Access with a Shared Access Signature 
Azure Storage Explorer
Use Azure Storage Explorer To Create A Blob In Object Storage
Azure Storage Security Guide 
Monitor A Storage Account In The Azure Portal 
Enabling Storage Logging And Accessing Log Data

Import and export data to Azure
What Is Azure Import/Export Service? 
Azure Import/Export FAQ
Azure Import/Export Pricing
What Is Azure Databox?
Azure Databox Family
Introduction To Azure Blog Storage
Azure Blog Storage
What Is A Content Delivery Network On Azure?
Create An Azure CDN Profile And Endpoint
Azure CDN Overview

Configure Azure Files
How To Create An Azure File Share
Deploy Azure Files Including Prerequisites 
Deploy Azure File Sync
Azure File Sync Firewall Settings
Planning For A File Sync Deployment
Manage Registered Servers With File Sync
Troubleshooting Azure Files (Windows)
Troubleshooting Azure File Sync

Implement Azure backup
Azure Backup Overview
Configuring Azure Backup Reports
Recovery Services Vault Overview
Backup An Azure VM From VM Settings
Azure Backup FAQ
Monitor And Manage Recovery Services Vaults
Manage Azure VM Backups
Recover Azure VMs
Restore Files To Windows

Deploy and manage virtual machines (VMs) (15-20%)
Create and configure a VM for Windows and Linux
Azure Resiliency 
Create And Deploy Highly Available Virtual Machines With Azure PowerShell 
Introducing Azure Availability Zones For Resiliency And High Availability 
Azure Monitor Overview
End-To-End Monitoring Solutions In Azure For Apps And Infrastructure
Virtual Machine Scalesets Overview
Create a Virtual Machine Scaleset In Azure Portal

Automate deployment of VMs
Create And Deploy Azure Resource Manager templates by using the Azure Portal
Update A Resource In An Azure Resource Manager Template
Understand The Structure And Syntax Of Azure Resource Manager Templates 
Azure Regions
Move Azure VMs To Another Region
Azure Products By Region
Migrate On-Premises VHD Files To Azure
Creating A VM In Azure Based On An Uploaded .vhd 
How To Attach And Mount VHD Files To Azure Virtual Machines

Manage Azure VM
Attach A Managed Data Disk To A Windows VM By Using The Azure Portal 
Use The Portal To Attach A Data Disk To A Linux VM 
Create, Change, Or Delete A Network Interface 
How To Reset Network Interface For Azure Windows VM 
Add Network Interfaces To Or Remove Network Interfaces From Virtual Machines 
Introduction To The Azure Desired State Configuration Extension Handler 
Azure Automation State Configuration Overview 
Using DSC On Microsoft Azure 
Getting Started With Azure Automation State Configuration 
Using Azure Custom Script Extension To Execute Scripts On Azure Vms
Azure Virtual Machine Series Types
Sizes For Windows Virtual Machines In Azure 
Redeploy Windows Virtual Machine To New Azure Node 
Redeploy Linux Virtual Machine To New Azure Node

Manage VM backups
Azure Backup Overview
Recovery Services Vault Overview
Backup an Azure VM from VM Settings
Backup Vault Configuration 
Azure Backup FAQ
Manage Azure VM Backups
Recover Azure VMs
Restore files to Windows
About Azure Site Recovery
Replicate An Azure VM To Another Region 
Azure Site Recovery FAQ

Configure and manage virtual networks (30-35%)
Create connectivity between virtual networks
Virtual Network Peering Overview
VNET Peering How To Via Portal
Another VNET Peering Example Via Portal
Global VNET Peering
Change Or Delete A VNET Peer Including Requirements And Constraints
Verify VNET Peer Connectivity
Azure VPN Gateway Overview
Azure VPN Gateway Creation And Manage

Implement and manage virtual networking
IP Address Types In Azure
Configure private IP addresses for a virtual machine using the Azure portal 
Create a virtual machine with a static private IP address using PowerShell 
Azure Virtual Network Overview 
Designing networking for Microsoft Azure IaaS 
Azure Gateway VPN & Custom Routing via Third-Party Firewall Appliance

Configure name resolution
What Is Azure DNS?
Configure Azure DNS Settings Via Portal
DNS Zones And Records
Private DNS Scenarios
Tutorial: Host Your Domain In Azure DNS
Tutorial: Create Private Azure DNS Zone And Records
Tutorial: Create An Alias Record To Refer To A Zone

Create and configure a Network Security Group (NSG)
Microsoft Azure:- NSGs & ASGs Simplified
Network Security Groups: 10 Suggestions For Best Practice! 
NSG Flow Logs
Read NSG Flow Logs 


Implement Azure load balancer
Azure Load Balancer Overview
What Is Azure Load Balancer?.
Tutorial: Load Balance Windows Virtual Machines In Azure To Create A Highly Available Application With Azure Powershell 
Quickstart: Create A Basic Load Balancer By Using The Azure Portal 
Tutorial: Load Balance Internet Traffic To Vms Using The Azure Portal 
Azue Load Balancer Health Probes
Troubleshoot Azure Load Balancer

Monitor and troubleshoot virtual networking
Azure Network Watcher 
Network Watcher VM Extension
Determine Latency Between A Location And Azure Region
Monitor Network Performance
Troubleshoot VPN Connectivity Problems
Log VM Network Traffic
Diagnose A VM Routing Problem
Monitor Communication Between VMs
On-Premise Connectivity 
View Network Topology Of Azure Virtual Network

Integrate on premises network with Azure virtual network
Virtual Network Peering Overview
VNET Peering How To Via Portal
Another VNET Peering Example Via Portal
Global VNET Peering
Change Or Delete A VNET Peer Including Requirements And Constraints
Verify VNET Peer Connectivity
Azure VPN Gateway Overview
Azure VPN Gateway Creation And Manage
Azure ExpressRoute Overview
Azure ExpressRoute FAQ
Azure ExpressRoute Circuits and Peers
Azure Network Watcher

Manage identities (15-20%)
Adding an Azure Custom Domain
Managing Custom Domains 
What is Azure AD Identity Protection?
Enable Azure AD Identity Protection
Configure MFA Registration Policy
Block Access When Session Risk Is Detected
Unblocking User
Azure AD Identity Protection FAQ 
Adding Device Using Azure AD Join
Plan Your Azure AD Join Implementation
What Is Enterprise State Roaming?
Enable Enterprise Station Roaming 

Manage Azure AD objects (users, groups, and devices)
Managing Multiple Directories
What Are Azure AD Access Reviews?
Create An Access Review
Start An Access Review
Complete An Access Review 
Add or delete users using Azure Active Directory 
Create a basic group and add members using Azure Active Directory 
How to manage devices using the Azure portal 
Azure Active Directory Bulk Update

Implement and manage hybrid identities
What Is Azure AD Connect?
Install AD Connect With Password Hash Sync
Running The Installation Wizard A Second Time
Azure AD Connect Design Concepts
Manage Federation With Azure AD Connect
Multiple Domain Support For Federating
Factors In Relation To Performance Of AD Connect
Azure AD Connect: Configure Single Sign-On
Single Sign-On FAQ
Azure AD Connect Health Operations

Implement multi-factor authentication (MFA)
What is Azure AD Identity Protection?
Enable Azure AD Identity Protection
Configure MFA Registration Policy
Block Access When Session Risk Is Detected
Unblocking User
Azure AD Identity Protection FAQ
NPS Server Configuration To Integrate with Azure MFA 
How it works: Azure MultiFactor authentication
Configure Azure Multi-Factor Authentication settings 
What Is The Location Condition In Azure Active Directory Conditional Access?