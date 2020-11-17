## set profile enable history 

```powershell
if (!(Test-Path -Path $Profile)) {`
New-Item -ItemType File -Path $Profile -Force`
}
echo $Profile
add-content $env:$Profile `
'env:Path += ;env:"'

function full_history {
    cat (Get-PSReadlineOption).HistorySavePath
}
```


# install powershell windows
```powershell
$PSVersionTable
Set-ExecutionPolicy Unrestricted
Install-Module -Name PowerShellGet -Force
Get-Module -ListAvailable
if ($PSVersionTable.PSEdition -eq 'Desktop' -and (Get-Module -Name AzureRM -ListAvailable)) { `
>>     Write-Warning -Message ('Az module not installed. Having both the AzureRM and ' + `
>>       'Az modules installed at the same time is not supported.') `
>> } else { `
>>     Install-Module -Name Az -AllowClobber -Scope AllUsers `
>> }
Connect-AzAccount
Get-AzSubscription
$context = <subscription_id>
Set-AzContext= $context
```

### Install install Azure CLI Tools linux

```bash
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
```

### Install Powershell on linux

```bash
# Update the list of packages
sudo apt-get update
# Install pre-requisite packages.
sudo apt-get install -y wget apt-transport-https
# Download the Microsoft repository GPG keys
wget -q https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb
# Register the Microsoft repository GPG keys
sudo dpkg -i packages-microsoft-prod.deb
# Update the list of packages after we added packages.microsoft.com
sudo apt-get update
# Install PowerShell
sudo apt-get install -y powershell
# Start PowerShell
pwsh
```


# az commands

```bash
# list account subscription
az account list --output=table
az account list-locations --output=table | egrep 'United'
```

# using SPN with az cli  

```
#login
az login
#get account list
az account list --output table
#set subscription
az account set --su <Azure-SubscriptionId>
#create Service Principal (SPN) account
az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/SUBSCRIPTION_ID"
az group create -l ukwest -n dah-Packer-RG
```

## create SPN and assign 
```
# create service principal
az login 
TENTANT_ID = <tentant_id>
SUBSCRIPTION_ID = <subscription_id>
az account set --subscription $SUBSCRIPTION_ID 
SERVICE_PRINCIPAL_JSON=$(az ad sp create-for-rbac --skip-assignment --name terrafrom-sp -o json)
echo $SERVICE_PRINCIPAL_JSON
SERVICE_PRINCIPAL=$(echo $SERVICE_PRINCIPAL_JSON | jq -r '.appId')
SERVICE_PRINCIPAL_SECRET=$(echo SERVICE_PRINCIPAL_JSON | jq -r '.password')
echo $SERVICE_PRINCIPAL
echo $SERVICE_PRINCIPAL_SECRET
az role assignment create --assignee $SERVICE_PRINCIPAL \
--scope "/subscriptions/"$SUBSCRIPTION_ID \
--role Contributor
```
