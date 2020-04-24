
## List storage account

````powershell
Get-AzStorageAccount | Select StorageAccountName, Location`
````

## Create new storage account

````powershell
# Get list of locations and select one.

Get-AzLocation | select Location
$location = "westeurope"

# Create a new resource group.
$resourceGroup = "dahresgrptst02"
New-AzResourceGroup -Name $resourceGroup -Location $location

# Set the name of the storage account and the SKU name.
$storageAccountName = "dahstortst02"
$skuName = "Standard_LRS"

# Create the storage account.
$storageAccount = New-AzStorageAccount -ResourceGroupName $resourceGroup `
  -Name $storageAccountName `
  -Location $location `
  -SkuName $skuName

# Retrieve the context.
$ctx = $storageAccount.Context
````

## create blob container 

````powershell
$containerName = "dahblobtest03"
New-AzStorageContainer -Name $containerName -Context $ctx -Permission blob
````


# upload a file

````powershell
Set-AzStorageBlobContent -File "C:\Users\daveh\Pictures\Saved Pictures\download.jpg" `
  -Container $containerName `
  -Blob "download.jpg" `
  -Context $ctx 
````

# download file

````powershell
Get-AzStorageBlobContent -Blob "download.jpg" `
  -Container $containerName `
  -Destination "C:\Users\daveh\Pictures\Saved Pictures\download_updated.jpg" `
  -Context $ctx 
````

# example of using azcopy 

````powershell
./AzCopy `
    /Source:C:\myfolder `
    /Dest:https://mystorageaccount.blob.core.windows.net/mystoragecontainer `
    /DestKey:<storage-account-access-key> `
    /Pattern:"myfile.txt"
````

# Delete all resources 

````powershell
Remove-AzResourceGroup -Name $resourceGroup
````

## Manage access keys

````powershell
$storageAccountKey = `
    (Get-AzStorageAccountKey `
    -ResourceGroupName $resourceGroup `
    -Name $storageAccountName).Value[0]
````

## regenerate keys

````powershell
New-AzStorageAccountKey -ResourceGroupName $resourceGroup `
  -Name $storageAccountName `
  -KeyName key1
````

