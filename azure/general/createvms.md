
## Create resource Group

````powershell
New-AzResourceGroup -Name dahresgrp -Location westeurope -Tag @{type="dev"; department="IT Dept"}
````

## Create Virtual Machines with powershell

````powershell
New-AzVm -ResourceGroupName 35b9e803-4bfa-47b0-9ad2-ed2fa027f117 -Name "testvm-eus-01" -Credential (Get-Credential) -Location "East US" -Image UbuntuLTS -OpenPorts 2
````
## Create windows VM from command line using New-AzVM

````powershell

#setup values for VM


$ResourceGroupName = "dahtestresgrp"
$LocationName = "westeurope"
$NetworkName = "dahvnet02"
$NICName = "dahnic01"
$SubnetName = "dahsubnet03"
$SubnetAddressPrefix = "10.0.0.0/27"
$VnetAddressPrefix = "10.0.0.0/16"
$VmSize = "Basic_A0"

#Create vnet and subnet 

$SingleSubnet = New-AzVirtualNetworkSubnetConfig -Name $SubnetName -AddressPrefix $SubnetAddressPrefix
$Vnet = New-AzVirtualNetwork -Name $NetworkName -ResourceGroupName $ResourceGroupName -Location $LocationName -AddressPrefix $VnetAddressPrefix -Subnet $SingleSubnet
$NIC = New-AzNetworkInterface -Name $NICName -ResourceGroupName $ResourceGroupName -Location $LocationName -SubnetId $Vnet.Subnets[0].Id


$VmName = Read-Host -Prompt "Enter VM Name to Create?"
write-host Creating $VmName "in" $resgroup "at location" $location 
New-AzVM -ResourceGroupName $resgroup -Name $VmName -Size $VmSize -Location $location -VirtualNetworkName $Vnet -SubnetName $SubnetName -SecurityGroupName "dahnsg" -PublicIpAddressName "dahpubipaddr01" -OpenPorts 80,3389,443
````

### Create function for above

```powershell
Function Create-MyVm {

    Param (
        [ValidateSet('dahtestresgrp','westeurope','10.0.0.0/16', ignorecase=$False)]
        [string] $ResourceGroupName = "dahtestresgrp",
        [string] $LocationName = "westeurope",
        [string] $VmName = "dahvm02",
        [string] $NetworkName = "dahvnet03",
        [string] $NICName = "dahvnic01",
        [string] $SubnetName = "dahsubnet02",
        [string] $SubnetAddressPrefix = "10.0.0.0/27",
        [string] $VnetAddressPrefix = "10.0.0.0/16")
        
    # Create Subnet 
    $SingleSubnet = New-AzVirtualNetworkSubnetConfig -Name $SubnetName -AddressPrefix $SubnetAddressPrefix
    $Vnet = New-AzVirtualNetwork -Name $NetworkName -ResourceGroupName $ResourceGroupName -Location $LocationName -AddressPrefix $VnetAddressPrefix -Subnet $SingleSubnet
    $NIC = New-AzNetworkInterface -Name $NICName -ResourceGroupName $ResourceGroupName -Location $LocationName -SubnetId $Vnet.Subnets[0].Id

write-host Creating $VmName "in" $ResourceGroupName "at location" $LocationName "using" $NetworkName 
New-AzVM -ResourceGroupName $ResourceGroupName -Name $VmName -Location $LocationName -VirtualNetworkName $NetworkName -SubnetName $SubnetName -SecurityGroupName "dahnsg" -PublicIpAddressName "dahpubipaddr01" -OpenPorts 80,3389,443
}
````

### List all resources in resource group
````powershell
Get-AzResource -ResourceGroupName $resgroup | ft
````

## cleanup all resources in resource group

````powershell
Remove-AzResourceGroup -Name $resgroup
````

## add resource group

````powershell
Add-AzResourceGroup -Name dahresgrp01 -Location westeurope
````
## Deploy vm from arm template

````powershell
$resourceGroupName = Read-Host -Prompt "Enter the Resource Group name (dahresgrp)"
$location = Read-Host -Prompt "Enter the location (i.e. westeurope)"
$templatefile = "C:\Users\daveh\Projects\azure-projects\arm templates\create_vm\dh_template.json"
$templateparam= "C:\Users\daveh\Projects\azure-projects\arm templates\create_vm\dh_dh_parameters.json"
New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateFile $templatefile -Template  $templateparam -Location $location
````
### Example 2

````powershell
 New-AzResourceGroupDeployment -ResourceGroupName "dahresgrp" -TemplateFile "C:\Users\daveh\Downloads\ExportedTemplate-CreateVm-MicrosoftWindowsServer.WindowsServer-201-20191204113451\template.json" -TemplateParameterFile "C:\Users\daveh\Downloads\ExportedTemplate-CreateVm-MicrosoftWindowsServer.WindowsServer-201-20191204113451\parameters.json"
````

## Redploy VM if faulty

````powershell
Set-AzVM -Redeploy -ResourceGroupName $resgroup  -Name "dahvm01"
````