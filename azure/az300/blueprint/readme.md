# <u> az300 blue print</u>

## <u>Analyze resource utilization and consumption</u>
May include but not limited to: Configure diagnostic settings on resources; create baseline for resources; create and rest alerts; analyze alerts across subscription; analyze metrics across subscription; create action groups; monitor for unused resources; monitor spend; report on spend; utilize Log Search query functions; view alerts in Log Analytics
Configure diagnostic settings on resources

https://azure.microsoft.com/en-gb/blog/azure-monitor-multiple-diagnostic-settings/
https://docs.microsoft.com/en-us/azure/monitoring-and-diagnostics/monitoring-overview-of-diagnostic-logs
https://docs.microsoft.com/en-us/azure/monitoring-and-diagnostics/monitoring-enable-diagnostic-logs-using-template

### <u> Create baseline for resources</u>
https://docs.microsoft.com/en-us/azure/monitoring-and-diagnostics/monitoring-alerts-dynamic-thresholds

### <u> Create and raise alerts; Analyze alerts across subscription</u>

 https://docs.microsoft.com/en-us/azure/monitoring-and-diagnostics/monitor-alerts-unified-usage

### <u>Monitor for unused resources; monitor spend; report on spend</u>
 
 https://docs.microsoft.com/en-us/azure/advisor/advisor-overview
 https://docs.microsoft.com/en-us/azure/billing/billing-getting-started
 https://docs.microsoft.com/en-us/azure/billing/billing-understand-your-bill

### <u>Utilize Log Search query functions;</u>

 https://docs.microsoft.com/en-gb/azure/log-analytics/log-analytics-queries

### <u>View alerts in Log Analytics</u>

 https://docs.microsoft.com/en-us/azure/log-analytics/log-analytics-solution-alert-management
 https://docs.microsoft.com/en-us/azure/monitoring-and-diagnostics/monitoring-overview-unified-alerts

----

## <u>Create and configure storage accounts</u>

May include but not limited to: Configure network access to the storage account; create and configure storage account;generate shared access signature; install and use Azure Storage Explorer; manage access keys; monitor activity log by using Log Analytics; implement Azure storage replication
Configure network access to the storage account;

 https://azure.microsoft.com/en-gb/blog/announcing-virtual-network-integration-for-azure-storage-and-azure-sql/

### <u>Create and configure storage account</u>
 https://docs.microsoft.com/en-us/azure/storage/common/storage-quickstart-create-account?tabs=portal
 https://www.pluralsight.com/courses/microsoft-azure-creating-configuring-storage-accounts

### <u>Generate shared access signature</u>

 https://docs.microsoft.com/en-us/azure/storage/common/storage-dotnet-shared-access-signature-part-1
 https://docs.microsoft.com/en-us/azure/storage/blobs/storage-dotnet-shared-access-signature-part-2
 https://docs.microsoft.com/en-us/rest/api/eventhub/generate-sas-token

### <u>Install and use Azure Storage Explorer</u>

https://azure.microsoft.com/en-gb/features/storage-explorer/

### <u>Manage access keys;</u>

https://docs.microsoft.com/en-us/azure/key-vault/key-vault-ovw-storage-keys
https://docs.microsoft.com/en-us/azure/storage/common/storage-account-manage

### <u>Monitor activity log by using Log Analytics</u>

https://docs.microsoft.com/en-us/azure/log-analytics/log-analytics-activity
https://docs.microsoft.com/en-us/azure/monitoring-and-diagnostics/monitoring-activity-log-alerts
https://docs.microsoft.com/en-us/azure/monitoring-and-diagnostics/monitoring-overview-activity-logs

### <u>Implement Azure storage replication</u>

https://docs.microsoft.com/en-us/azure/storage/common/storage-redundancy
https://docs.microsoft.com/en-us/azure/storage/common/storage-redundancy-grs

----

## <u>Create and configure a Virtual Machine (VM) for Windows and Linux</u>

May include but not limited to: Configure high availability; configure monitoring, networking, storage, and virtual machine size; deploy and configure scale sets

### <u>Overview</u>

 https://docs.microsoft.com/en-us/azure/virtual-machines/linux/

### <u>Configure high availability</u>

 https://docs.microsoft.com/en-us/azure/virtual-machines/linux/tutorial-availability-sets
 https://docs.microsoft.com/en-us/azure/virtual-machines/linux/manage-availability

### <u>Configure monitoring, networking, storage, and virtual machine size</u>

 https://docs.microsoft.com/en-us/azure/virtual-machines/linux/tutorial-monitoring

### <u>Deploy and configure scale sets</u>

 https://docs.microsoft.com/en-us/azure/virtual-machines/linux/tutorial-create-vmss

## <u>Automate deployment of Virtual Machines (VMs)</u>

May include but not limited to: Modify Azure Resource Manager (ARM) template; configure location of new VMs; configure VHD template; deploy from template; save a deployment as an ARM template; deploy Windows and Linux VMs

### <u>Modify Azure Resource Manager (ARM) template</u>

 https://docs.microsoft.com/en-us/azure/devops/pipelines/apps/cd/azure/build-azure-vm-template?view=vsts

### <u>Configure location of new VMs</u>

 https://docs.microsoft.com/en-us/azure/virtual-machines/windows/quick-create-portal
 https://docs.microsoft.com/en-us/azure/virtual-machines/windows/tutorial-manage-vm

### <u>Configure VHD template</u>

 https://docs.microsoft.com/en-us/azure/virtual-machines/windows/create-vm-specialized
 https://docs.microsoft.com/en-us/azure/virtual-machines/windows/prepare-for-upload-vhd-image
 https://azure.microsoft.com/en-gb/resources/templates/201-vm-specialized-vhd-new-or-existing-vnet/

### <u>Deploy from template</u>

 https://docs.microsoft.com/en-us/azure/virtual-machines/windows/ps-template
 https://docs.microsoft.com/en-us/azure/virtual-machines/linux/create-ssh-secured-vm-from-template

### <u>Save a deployment as an ARM template<u>

 https://docs.microsoft.com/en-us/azure/lab-services/devtest-lab-use-resource-manager-template
 https://docs.microsoft.com/en-us/azure/virtual-machines/windows/download-template

### <u>Deploy Windows and Linux VMs</u>

 https://azure.microsoft.com/id-id/services/virtual-machines/

----

## <u>Create connectivity between virtual networks</u>

May include but not limited to: Create and configure VNET peering; create and configure VNET to VNET; verify virtual network connectivity; create virtual network gateway
Create and configure VNET peering; create and configure VNET to VNET

 http://www.msserverpro.com/configuring-azure-vnet-peering-using-azure-portal/
 https://docs.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-howto-vnet-vnet-resource-manager-portal
 https://docs.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-vnet-vnet-rm-ps

### <u>Verify virtual network connectivity;</u>

 https://docs.microsoft.com/en-us/azure/vpn-gateway/ 

### <u>vpn-gateway-howto-site-to-site-resource-manager-portal#VerifyConnection</u>

 https://docs.microsoft.com/en-us/azure/virtual-network/virtual-network-peering-overview

### <u>Create virtual network gateway</u>

h ttps://docs.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-about-vpngateways
 https://blogs.technet.microsoft.com/canitpro/2017/06/28/step-by-step-configuring-a-site-to-site-vpn-gateway-between-azure-and-on-premise/
 https://docs.microsoft.com/en-us/azure/vpn-gateway/create-routebased-vpn-gateway-portal

----

## <u>Implement and manage virtual networking</u>

May include but not limited to: Configure private and public IP addresses, network routes, network interface, subnets,and virtual network

### <u>Configure private and public IP addresses, network routes, network interface, subnets, and virtual network</u>

 https://docs.microsoft.com/en-us/azure/virtual-network/virtual-networks-static-private-ip-arm-pportal
 https://docs.microsoft.com/en-us/azure/virtual-network/virtual-network-ip-addresses-overview-arm
 https://docs.microsoft.com/en-us/azure/virtual-network/virtual-network-network-interface-addresses

## <u>Manage Azure Active Directory (AD)</u>

May include but not limited to: Add custom domains; configure Azure AD Identity Protection, Azure AD Join, and Enterprise State Roaming; configure self-service password reset; implement conditional access policies; manage multiple directories; perform an access review

### <u>Add custom domains;</u>

 https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/add-custom-domain

### <u>Configure Azure AD Identity Protection, Azure AD Join, and Enterprise State Roaming</u>

 https://docs.microsoft.com/en-gb/azure/active-directory/identity-protection/enable
  https://docs.microsoft.com/en-gb/azure/active-directory/user-help/user-help-join-device-on-network
 https://docs.microsoft.com/en-us/azure/active-directory/active-directory-windows-enterprise-state-roaming-overview

### <u>Configure self-service password reset</u>

 https://docs.microsoft.com/en-gb/azure/active-directory/authentication/concept-sspr-howitworks

### <u>Implement conditional access policies;</u>

 https://docs.microsoft.com/en-gb/azure/active-directory/conditional-access/app-based-mfa

### <u>Manage multiple directories</u>

 https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/active-directory-administer#how-can-i-add-and-manage-multiple-directories

### <u>Perform an access review</u>

 https://docs.microsoft.com/en-gb/azure/active-directory/governance/access-reviews-overview

----

## <u>Implement and manage hybrid identities</u>

May include but not limited to: Install and configure Azure AD Connect; configure federation and single sign-on; manage Azure AD Connect; manage password sync and writeback

### <u>Install and configure Azure AD Connect;<u>

 https://docs.microsoft.com/en-gb/azure/active-directory/hybrid/whatis-hybrid-identity#install-azure-ad-connect

### <u>Configure federation and single sign-on

 https://docs.microsoft.com/en-gb/azure/active-directory/hybrid/whatis-hybrid-identity

### <u>Manage Azure AD Connect</u>

 https://docs.microsoft.com/en-gb/azure/active-directory/hybrid/how-to-connect-post-installation

### <u>Manage password sync and writeback</u>

 https://docs.microsoft.com/en-us/azure/active-directory/authentication/howto-sspr-writeback

----

## <u>Implement Workloads and Security (20-25%)</u>

Migrate servers to Azure

May include but not limited to: Migrate by using Azure Site Recovery (ASR); migrate using P2V; configure storage; create a backup vault; prepare source and target environments; backup and restore data; deploy Azure Site Recovery (ASR) agent; prepare virtual network

### <u>Migrate by using Azure Site Recovery (ASR);</u>

https://docs.microsoft.com/en-us/azure/site-recovery/migrate-tutorial-on-premises-azure

### <u>Migrate using P2V</u>

https://docs.microsoft.com/en-us/azure/site-recovery/physical-azure-disaster-recovery

### <u>Configure storage</u>

https://docs.microsoft.com/en-us/azure/site-recovery/tutorial-prepare-azure#create-a-storage-account

### <u>Create a backup vault</u>

https://docs.microsoft.com/en-us/azure/site-recovery/migrate-tutorial-on-premises-azure#create-a-recovery-services-vault

### <u>Prepare source and target environments</u>

https://docs.microsoft.com/en-us/azure/site-recovery/migrate-tutorial-on-premises-azure#set-up-the-source-environment

### <u>Backup and restore data</u>

https://docs.microsoft.com/en-us/azure/backup/backup-azure-recovery-services-vault-overview

### <u>Deploy Azure Site Recovery (ASR) agent</u>

https://docs.microsoft.com/en-us/azure/site-recovery/hyper-v-azure-tutorial#install-the-provider

### <u>Prepare virtual network</u>

https://docs.microsoft.com/en-us/azure/site-recovery/tutorial-prepare-azure#set-up-an-azure-network

----

## <u>Configure serverless computing</u>

May include but not limited to: Create and manage objects; manage a Logic App resource; manage Azure Function app settings; manage Event Grid; manage Service Bus

### <u>Create and manage objects</u>

https://azure.microsoft.com/en-gb/overview/serverless-computing/

### <u>Manage a Logic App resource</u>

https://docs.microsoft.com/en-us/azure/logic-apps/

### <u>Manage Azure Function app settings</u>

https://docs.microsoft.com/en-us/azure/azure-functions/functions-how-to-use-azure-function-app-settings

### <u>Manage Event Grid</u>

https://docs.microsoft.com/en-us/azure/event-grid/

### <u>Manage Service Bus</u>

https://docs.microsoft.com/en-gb/azure/service-bus-messaging/

----

## <u>Implement application load balancing</u>

May include but not limited to: Configure application gateway and load balancing rules; implement front end IP configurations; manage application load balancing
Configure application gateway and load balancing rules

https://docs.microsoft.com/en-us/azure/application-gateway/application-gateway-introduction
https://docs.microsoft.com/en-us/azure/application-gateway/application-gateway-ilb-arm
https://azure.microsoft.com/en-gb/services/application-gateway/

### <u>Implement front end IP configurations</u>

https://docs.microsoft.com/en-us/rest/api/load-balancer/loadbalancerfrontendipconfigurations/get
https://docs.microsoft.com/en-us/azure/load-balancer/load-balancer-overview

### <u>Manage application load balancing</u>

https://docs.microsoft.com/en-us/azure/load-balancer/tutorial-load-balancer-standard-manage-portal

----

## <u>Integrate on premises network with Azure virtual network</u>

May include but not limited to: Create and configure Azure VPN Gateway; create and configure site to site VPN; configure Express Route; verify on premises connectivity; manage on-premise connectivity with Azure
Create and configure Azure VPN Gateway

https://docs.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-about-vpngateways
https://docs.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-tutorial-create-gateway-powershell

### <u>Create and configure site to site VPN</u>

https://blogs.technet.microsoft.com/canitpro/2017/06/28/step-by-step-configuring-a-site-to-site-vpn-gateway-between-azure-and-on-premise/
https://docs.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-howto-site-to-site-resource-manager-portal

### <u>Configure Express Route</u>

https://docs.microsoft.com/en-us/azure/expressroute/
https://docs.microsoft.com/en-us/azure/expressroute/expressroute-howto-circuit-portal-resource-manager
https://docs.microsoft.com/en-us/azure/expressroute/expressroute-howto-routing-portal-resource-manager

### <u>Verify on premises connectivity</u>

https://docs.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-howto-site-to-site-resource-manager-portal

### <u>Manage on-premise connectivity with Azure</u>

https://docs.microsoft.com/en-us/office365/enterprise/

----

## <u>connect-an-on-premises-network-to-a-microsoft-azure-virtual-network</u>

Manage role-based access control (RBAC)

May include but not limited to: Create a custom role; configure access to Azure resources by assigning roles; configure management access to Azure; troubleshoot RBAC; implement RBAC policies; assign RBAC roles

### <u>Create a custom role</u>

https://docs.microsoft.com/en-us/azure/role-based-access-control/custom-roles

### <u>Configure access to Azure resources by assigning roles</u>

https://docs.microsoft.com/en-us/azure/role-based-access-control/role-assignments-portal

### <u>Configure management access to Azure</u>

https://docs.microsoft.com/en-us/azure/active-directory/users-groups-roles/directory-admin-roles-secure

### <u>Troubleshoot RBAC</u>

https://docs.microsoft.com/en-us/azure/role-based-access-control/troubleshooting

### <u>Implement RBAC policies</u>

https://docs.microsoft.com/en-us/azure/governance/policy/overview

### <u>Assign RBAC roles</u>

https://docs.microsoft.com/en-us/azure/role-based-access-control/role-assignments-portal#grant-access

----

### <u>Implement Multi-Factor Authentication (MFA)</u>

May include but not limited to: Enable MFA for an Azure tenant; configure user accounts for MFA; configure fraud alerts; configure bypass options; configure trusted IPs; configure verification methods; manage role-based access control (RBAC); implement RBAC policies; assign RBAC Roles; create a custom role; configure access to Azure resources by assigning roles; configure management access to Azure

### <u>Enable MFA for an Azure tenant;<u>

https://docs.microsoft.com/en-us/azure/active-directory/authentication/howto-mfa-getstarted#enable-azure-multi-factor-authentication

### <u>Configure user accounts for MFA</u>

https://docs.microsoft.com/en-us/azure/active-directory/authentication/howto-mfa-userstates

### <u>Configure fraud alerts</u>

https://docs.microsoft.com/en-us/azure/active-directory/authentication/howto-mfa-mfasettings#fraud-alert

### <u>Configure bypass options</u>

https://docs.microsoft.com/en-us/azure/active-directory/authentication/howto-mfa-mfasettings#one-time-bypass

### <u>Configure trusted IPs</u>

https://docs.microsoft.com/en-us/azure/active-directory/authentication/howto-mfa-mfasettings#trusted-ips

### <u>Configure verification methods</u>

https://docs.microsoft.com/en-us/azure/active-directory/authentication/

## <u>howto-mfa-mfasettings#selectable-verification-methods</u>

### <u>Manage role-based access control (RBAC)</u>

https://docs.microsoft.com/en-us/azure/role-based-access-control/role-assignments-portal

### <u>Implement RBAC policies</u>

https://www.youtube.com/watch?v=q_KK9fX-wKI

### <u>Assign RBAC Roles</u>

https://docs.microsoft.com/en-us/azure/role-based-access-control/

### <u>Create a custom role</u>

https://docs.microsoft.com/en-us/azure/role-based-access-control/custom-roles

### <u>Configure access to Azure resources by assigning roles</u>

https://docs.microsoft.com/en-us/azure/role-based-access-control/role-assignments-portal

### <u>Configure management access to Azure</u>

https://docs.microsoft.com/en-us/azure/role-based-access-control/overview

----

## <u>Architect Cloud Technology Solutions (5-10%)</u>

Select an appropriate compute solution

May include but not limited to: Leverage appropriate design patterns; select appropriate network connectivity options;design for hybrid topologies

### <u>Leverage appropriate design patterns</u>

https://msdn.microsoft.com/en-gb/magazine/dd727504.aspx

### <u>Select appropriate network connectivity options</u>

https://www.moqdigital.com.au/insights/technical/network-connectivity-options-for-azure

### <u>Design for hybrid topologies</u>

https://docs.microsoft.com/en-us/azure/active-directory/hybrid/plan-connect-topologies

----

## <u>Select an appropriate integration solution</u>

May include but not limited to: Address computational bottlenecks, state management, and OS requirements; provide for web hosting if applicable; evaluate minimum number of nodes
Address computational bottlenecks, state management, and OS requirements

https://azure.microsoft.com/en-us/blog/microsoft-azure-the-cloud-for-high-performance-computing/

https://azure.microsoft.com/en-gb/blog/improving-your-io-performance/

----

### <u>Provide for web hosting if applicable</u>

https://azure.microsoft.com/en-us/resources/videos/inside-azure-web-hosting-plans/

May include but not limited to: Validate data storage technology capacity limitations; address durability of data; provide for appropriate throughput of data access; evaluate structure of data storage; provide for data archiving, retention, and compliance

### <u>Validate data storage technology capacity limitations Address durability of data</u>

https://docs.microsoft.com/en-us/azure/storage/common/storage-introduction

Provide for appropriate throughput of data access
Evaluate structure of data storage

https://docs.microsoft.com/en-us/azure/architecture/guide/technology-choices/data-store-overview
https://docs.microsoft.com/en-us/azure/architecture/guide/technology-choices/data-store-comparison

Provide for data archiving, retention, and compliance
https://azure.microsoft.com/en-gb/solutions/backup-archive/

----

## <u>Create and Deploy Apps (5-10%)</u>

Create web applications by using PaaS
May include but not limited to: Create an Azure app service web app by using Azure CLI, PowerShell, and other tools; create documentation for the API by using open source and other tools; create an App Service Web App for containers; create an App Service background task by using WebJobs

Create an Azure app service web app by using Azure CLI, PowerShell, and other tools

https://docs.microsoft.com/en-us/azure/app-service/app-service-cli-samples

https://docs.microsoft.com/en-us/azure/app-service/scripts/app-service-cli-deploy-staging-environment

Create documentation for the API by using open source and other tools

https://blogs.msdn.microsoft.com/appserviceteam/tag/swagger/

Create an App Service Web App for containers

https://azure.microsoft.com/en-gb/services/app-service/containers/

https://docs.microsoft.com/en-us/azure/app-service/containers/

Create an App Service background task by using WebJobs

https://www.hanselman.com/blog/IntroducingWindowsAzureWebJobs.aspx

https://docs.microsoft.com/en-us/azure/app-service/webjobs-sdk-get-started

https://docs.microsoft.com/en-us/azure/app-service/websites-dotnet-deploy-webjobs

https://docs.microsoft.com/en-us/azure/app-service/web-sites-create-web-jobs

----

Create app or service that runs on Service Fabric

May include but not limited to: Develop a stateful Reliable Service and a stateless Reliable Service; develop an actor-based Reliable Service; write code to consume Reliable Collections in your service

Develop a stateful Reliable Service and a stateless Reliable Service

https://docs.microsoft.com/en-us/azure/service-fabric/service-fabric-reliable-services-introduction

https://docs.microsoft.com/en-us/azure/service-fabric/service-fabric-reliable-services-quick-start

Develop an actor-based Reliable Service

https://azure.microsoft.com/en-gb/resources/videos/azure-service-fabric-and-the-actor-model-with-mark-fussell/

https://channel9.msdn.com/Events/Journey-to-the-Websummit–Online-Masterclasses/
Service-Fabric-and-actor-model-architectures–Joo-Pedro-Martins-Microsoft-UK/Service-Fabric-and-actor-model-architectures–Joo-Pedro-Martins-Microsoft-UK

Write code to consume Reliable Collections in your service

https://docs.microsoft.com/en-us/azure/service-fabric/service-fabric-reliable-services-reliable-collections

----

Design and develop applications that run in containers

May include but not limited to: Configure diagnostic settings on resources; create a container image by using a Docker file; create an Azure Container Service (ACS/AKS) cluster by using the Azure CLI and Azure Portal; publish an image to the Azure Container Registry; implement an application that runs on an Azure Container Instance; implement container instances by using Azure Container Service (ACS/AKS), Azure Service Fabric, and other tools; manage container settings by using code

Configure diagnostic settings on resources;

https://azure.microsoft.com/en-gb/overview/containers/

https://docs.microsoft.com/en-us/azure/containers/

Create a container image by using a Docker file

https://blogs.msdn.microsoft.com/uk_faculty_connection/2016/09/23/getting-started-with-docker-and-container-services/
https://docs.docker.com/docker-for-azure/deploy/

Create an Azure Container Service (ACS/AKS) cluster by using the Azure CLI and Azure Portal

https://stackify.com/azure-container-service-kubernetes/

https://azure.microsoft.com/en-gb/services/kubernetes-service/

Publish an image to the Azure Container Registry

https://docs.microsoft.com/en-us/azure/container-registry/container-registry-get-started-docker-cli

https://docs.microsoft.com/en-us/azure/container-registry/container-registry-tutorial-quick-task

Implement an application that runs on an Azure Container Instance

https://azure.microsoft.com/en-gb/services/container-instances/

https://docs.microsoft.com/en-us/azure/container-instances/container-instances-quickstart

Implement container instances by using Azure Container Service (ACS/AKS), Azure Service Fabric, and other tools

https://medium.com/bitnami-perspectives/az-aci-aks-acs-in-5-minutes-top-chrono-65c9952dfeb8

Manage container settings by using code
https://azure.microsoft.com/en-gb/resources/samples/container-service-python-manage/ 

----

Implement Authentication and Secure Data (5-10%)

Implement authentication
May include but not limited to: Implement authentication by using certificates, forms-based authentication, tokens, Windows-integrated authentication; implement multi-factor authentication by using Azure AD options

Implement authentication by using certificates, forms-based authentication, tokens, Windows-integrated authentication

https://docs.microsoft.com/en-us/azure/app-service/app-service-authentication-overview

https://docs.microsoft.com/en-us/azure/active-directory/develop/authentication-scenarios

https://azure.microsoft.com/en-gb/blog/azure-websites-authentication-authorization/

Implement multi-factor authentication by using Azure AD options

https://docs.microsoft.com/en-us/azure/active-directory/authentication/concept-mfa-howitworks

https://azure.microsoft.com/en-gb/resources/videos/multi-factor-authentication-for-azure-ad/

----

Implement secure data solutions

May include but not limited to: Encrypt and decrypt data at rest; encrypt data with Always Encrypted; implement Azure Confidential Compute and SSL/TLS communications; manage cryptographic keys in the Azure Key Vault
Encrypt and decrypt data at rest

https://cloudacademy.com/blog/how-does-azure-encrypt-data/

Encrypt data with Always Encrypted

https://azure.microsoft.com/en-us/blog/transparent-data-encryption-or-always-encrypted/

https://docs.microsoft.com/en-us/azure/sql-database/sql-database-always-encrypted

https://docs.microsoft.com/en-us/azure/sql-database/sql-database-always-encrypted-azure-key-vault

Implement Azure Confidential Compute and SSL/TLS communications

https://docs.microsoft.com/en-us/azure/security/azure-security-data-encryption-best-practices

https://azure.microsoft.com/en-gb/blog/introducing-azure-confidential-computing/

https://azure.microsoft.com/en-gb/blog/azure-confidential-computing/

Manage cryptographic keys in the Azure Key Vault

https://docs.microsoft.com/en-us/azure/key-vault/key-vault-overview

https://docs.microsoft.com/en-us/azure/key-vault/key-vault-whatis

https://azure.microsoft.com/en-gb/services/key-vault/

https://docs.microsoft.com/en-us/azure/key-vault/about-keys-secrets-and-certificates

----

Develop for the Cloud (20-25%)
Develop long-running tasks
May include but not limited to: Implement large-scale, parallel, and high-performance apps by using batches; implement resilient apps by using queues; implement code to address application events by using web hooks; address continuous processing tasks by using web jobs
Implement large-scale, parallel, and high-performance apps by using batches

https://docs.microsoft.com/en-us/azure/batch/batch-technical-overview

https://azure.microsoft.com/en-gb/solutions/big-compute/

Implement resilient apps by using queues

https://docs.microsoft.com/en-us/azure/architecture/resiliency/

https://azure.microsoft.com/en-gb/blog/using-the-retry-pattern-to-make-your-cloud-application-more-resilient/

Implement code to address application events by using web hooks

https://docs.microsoft.com/en-us/azure/automation/automation-webhooks

https://thenewstack.io/tutorial-exploring-azure-event-grid-custom-webhooks/

Address continuous processing tasks by using web jobs

https://docs.microsoft.com/en-us/azure/architecture/best-practices/background-jobs

https://blog.comminus.hr/Comminus-Blog/January-2018/Run-continuous-or-triggered-background-task-with-W.aspxhttps://
exceptionless.com/better-approach-running-azure-webjobs/

----

Configure a message-based integration architecture

May include but not limited to: Configure an app or service to send emails, Event Grid, and the Azure Relay Service; create and configure a Notification Hub, an Event Hub, and a Service Bus; configure queries across multiple products; configure an app or service with Microsoft Graph

Configure an app or service to send emails, Event Grid, and the Azure Relay Service
https://docs.microsoft.com/en-us/azure/service-bus-messaging/service-bus-to-event-grid-integration-example
https://docs.microsoft.com/en-us/azure/event-grid/custom-event-to-hybrid-connection
https://azure.microsoft.com/en-gb/blog/azure-service-bus-now-integrates-with-azure-event-grid/

Create and configure a Notification Hub, an Event Hub, and a Service Bus
https://docs.microsoft.com/en-us/azure/notification-hubs/notification-hubs-push-notification-overview
https://azure.microsoft.com/en-gb/resources/videos/azure-service-bus-event-hubs-101-with-dan-rosanova/
https://azure.microsoft.com/en-gb/blog/events-data-points-and-messages-choosing-the-right-azure-messaging-service-for-your-data/
https://docs.microsoft.com/en-us/azure/notification-hubs/

Configure queries across multiple products
https://azure.microsoft.com/en-gb/product-categories/integration/
https://azure.microsoft.com/en-us/blog/collaboration-and-federation-azure-service-bus-messaging-on-premises-futures/

Configure an app or service with Microsoft Graph
https://developer.microsoft.com/en-us/graph
https://developer.microsoft.com/en-us/graph/docs/concepts/overview

----

Develop for asynchronous processing

May include but not limited to: Implement parallelism, multithreading, processing, durable functions, Azure logic apps, interfaces with storage, interfaces to data access, and appropriate asynchronous compute models
Implement parallelism, multithreading, processing, durable functions, Azure logic apps, interfaces with storage, interfaces to data access, and appropriate asynchronous compute models

https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-manager-async-operations
https://docs.microsoft.com/en-us/azure/azure-functions/durable-functions-overview
https://www.pluralsight.com/courses/azure-durable-functions-fundamentals?gclid=EAIaIQobChMIjpGLv7_o3QIVqrDtCh11bwoNEAAYASAAEgIKkPD_BwE&aid=701j0000001heIpAAI&promo=&oid=&utm_source=non_branded&utm_medium=digital_paid_search_google&utm_campaign=UK_Dynamic&utm_content=&s_kwcid=AL!5668!3!277727472896!b!!g!!&ef_id=WyEQRAAAALSF5mjc:20181002193153:s
https://docs.microsoft.com/en-us/azure/architecture/guide/technology-choices/compute-comparison

----

Develop for autoscaling

May include but not limited to: Implement autoscaling rules and patterns (schedule, operational/system metrics, code that addresses singleton application instances, and code that addresses transient state
Implement autoscaling rules and patterns
https://azure.microsoft.com/en-gb/features/autoscale/
https://docs.microsoft.com/en-us/azure/monitoring-and-diagnostics/monitoring-overview-autoscale
https://docs.microsoft.com/en-us/azure/architecture/best-practices/auto-scaling
https://docs.microsoft.com/en-us/azure/virtual-machines/windows/autoscale

----

Implement distributed transactions
May include but not limited to: Identify tools to implement distributed transactions (e.g., ADO.NET, elastic transactions, multi-database transactions); manage transaction scope; manage transactions across multiple databases and servers

Identify tools to implement distributed transactions (e.g., ADO.NET, elastic transactions, multi-database transactions);

https://docs.microsoft.com/en-us/azure/sql-database/sql-database-elastic-transactions-overview

Manage transaction scope
https://social.technet.microsoft.com/wiki/contents/articles/1639.handling-transactions-in-windows-azure-sql-database.aspx

Manage transactions across multiple databases and servers
https://azure.microsoft.com/en-us/blog/tag/distributed-transactions/
https://docs.microsoft.com/en-us/azure/sql-database/sql-database-elastic-transactions-overview
https://azure.microsoft.com/en-us/blog/elastic-database-transactions-general-availability/
https://docs.particular.net/nservicebus/azure/understanding-transactionality-in-azure

----

Develop advanced cloud workloads

May include but not limited to: Develop solutions by using intelligent algorithms that identify items from images and videos; develop solutions by using intelligent algorithms related to speech, natural language processing, Bing Search, and recommendations and decision making; create and integrate bots; integrate machine learning solutions in an app; create and implement IoT solutions
Develop solutions by using intelligent algorithms that identify items from images and videos
https://docs.microsoft.com/en-us/learn/modules/classify-images-with-custom-vision-service/index
https://docs.microsoft.com/en-us/learn/modules/create-computer-vision-service-to-classify-images/index
Develop solutions by using intelligent algorithms related to speech, natural language processing, Bing Search, and recommendations and decision making
https://docs.microsoft.com/en-us/azure/cognitive-services/bing-web-search/
https://docs.microsoft.com/en-us/azure/cognitive-services/custom-decision-service/custom-decision-service-overview
https://docs.microsoft.com/en-gb/azure/cognitive-services/speech-service/
Create and integrate bots
https://docs.microsoft.com/en-us/azure/bot-service/bot-service-overview-introduction?view=azure-bot-service-4.0
Integrate machine learning solutions in an app
https://docs.microsoft.com/en-us/azure/machine-learning/
Create and implement IoT solutions
https://azure.microsoft.com/en-gb/overview/iot/build/

