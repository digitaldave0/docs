## Login

### Install install Azure CLI Tools

```bash
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
```

### Install Powershell 

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


# commands

```bash
# list account subscription
az account list --output=table
az account list-locations --output=table | egrep 'United'
```