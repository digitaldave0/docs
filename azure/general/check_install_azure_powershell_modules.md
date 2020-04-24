## Azure PowerShell Az module changes

Starting in December 2018, the Azure PowerShell Az module is in general release and now the intended PowerShell module for interacting with Azure. Az offers shorter commands, improved stability, and cross-platform support. Az also offers feature parity and an easy migration path from AzureRM.

With the Az module, Azure PowerShell is now compatible with PowerShell 5.1 on Windows and PowerShell Core 6.x and later on all supported platforms - including Windows, macOS, and Linux.

Az is a new module, so the version has been reset to 1.0.0.

Check Current Version

````powershell
$PSVersionTable.PSVersion
````
## Install Powershell Core 6.0 New Az Module

````powershell
Install-Module -Name Az -AllowClobbber
Install-Module -Name Az -AllowClobbber -Force
````

## Check & Install Powershell Modules for Azure

+ Check and install Azure Powershell Modules and Login to Azure account

````powershell
Get-Module PowershellGet --list | Select-Object Name,Version,Path
Get-Module Azure
Install-Module Azure -AllowClobber
Import-Module Azure
Login-AzureRmAccount
````