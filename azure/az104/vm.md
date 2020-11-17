## Create VM

```powershell
$suffix = Get-Random -Maximum 1000
$today=Get-Date -Format "MMddyyyy"
$rg = "dah" +$suffix
New-AzResourceGroup -Name $rg -Location "uk west" 
$cred = Get-Credential 
$VName = "dah" + $today 
$Location = "ukwest"
$VirtualNetworkName = "network"
New-AzVm `
    -ResourceGroupName $rg `
    -Name $VName `
    -Location $Location `
    -VirtualNetworkName "dah" + $VirtualNetworkName  `
    -SubnetName "dahsubnet" `
    -SecurityGroupName "dahNetworkSecurityGroup" `
    -PublicIpAddressName "dahPublicIpAddress" `
    -OpenPorts 80,3389 `
    -Credential $cred

$pubip = Get-AzPublicIpAddress -ResourceGroupName $rg | Select "IpAddress"

mstsc /v<pubip>
```

## Get Images from Sku, Offer

```powershell
Get-AzVMImageOffer -location $Location -PublisherName "MicrosoftWindowsServer"
Get-AzVMImageSku -Location $Location -PublisherName "MicrosoftWindowsServer" -Offer "WindowsServer"
```
