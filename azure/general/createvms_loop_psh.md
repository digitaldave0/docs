# Notes

> Create VMS's within powershell loop

Below shows how to create vms with powershell

```powershell
param([string]$resourceGroup)
$adminCredential = Get-Credential -Message "Enter a username and password for the VM administrator."
For ($i = 1; $i -le 3; $i++) 
{
$vmName = "ConferenceDemo" + $i
Write-Host "Creating VM: " $vmName
New-AzVm -ResourceGroupName $resourceGroup -Name $vmName -Credential $adminCredential -Image UbuntuLTS
```

To get a list of azure vms

> Get-AzResource -ResourceType Microsoft.Compute/virtualMachines

Remove resource group

> Remove-AzResourceGroup -Name MyResourceGroupName

Create SSH Keygen 

Here is the minimum command necessary to generate the key pair for an Azure VM. This will create an SSH protocol 2 (SSH-2) RSA public-private key pair. The minimum length is 2048, but for the sake of this learning module we will use 4096.

```
ssh-keygen -t rsa -b 4096
ssh-copy-id -i ~/.ssh/id_rsa.pub azureuser@myserver
```

The tool will prompt for file names and an optional passphrase. For this exercise, just take the defaults. It will create two files: id_rsa and id_rsa.pub in the ~/.ssh directory. The files will be overwritten if they exist. There are various options you can use to provide the file name or a passphrase to avoid the prompt.

