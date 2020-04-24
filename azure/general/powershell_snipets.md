
### Install Powershell core on ubuntu 

````bash
sudo curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add - 
sudo curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list | sudo tee /etc/apt/sources.list.d/microsoft.list 
sudo apt-get update 
sudo apt-get install -y powershell
````

## Install Powershell core on Windows

````powershell
iex "& { $(irm https://aka.ms/install-powershell.ps1) } -UseMSI"
````

To start PowerShell Core, just type pwsh in your shell.
 
## Load Modules for Azure Administration

````powershell
Get-Module -ListAvailable
Install-Module -Name AzureRM.Netcore -Scope CurrentUser
Install-Module -Name AzureRM.Netcore
Install-Module Az
````
## Connect to azure 

`````powershell
connect-azAccount
````

## Powershell Billing Example

### Register Policy Insights

+ Register the Policy Insights resource provider using Azure PowerShell. Registering the resource provider makes sure that your subscription works with it. To register a resource provider, you must have permission to the register resource provider operation. This operation is included in the Contributor and Owner roles. Run the following command to register the resource provider:

````powershell
# Register the resource provider if it's not already registered
Register-AzResourceProvider -ProviderNamespace 'Microsoft.PolicyInsights'
````

### Create a policy assignment

````powershell
# Get a reference to the resource group that will be the scope of the assignment
$rg = Get-AzResourceGroup -Name '<resourceGroupName>'

# Get a reference to the built-in policy definition that will be assigned
$definition = Get-AzPolicyDefinition | Where-Object { $_.Properties.DisplayName -eq 'Audit VMs that do not use managed disks' }

# Create the policy assignment with the built-in definition against your resource group
New-AzPolicyAssignment -Name 'audit-vm-manageddisks' -DisplayName 'Audit VMs without managed disks Assignment' -Scope $rg.ResourceId -PolicyDefinition $definition
````

See Azure policy samples [Azure Policy](https://github.com/Azure/azure-policy)

````powershell
Enable-AzVMPSRemoting -Name DEMOLABVM01 -ResourceGroupName rg511417

Invoke-AzVMCommand -Name DEMOLABVM01 -ResourceGroupName rg511417 -Scriptblock { Install-WindowsFeature -Name Web-Server } -Credential labadmin

$Script={ Set-Content -Path "C:\\inetpub\\wwwroot\\Default.htm" -Value "<html><body><h2>Congratulations!</h2><p>You have just created a basic website on $($env:computername).</p></body></html>" }
````
