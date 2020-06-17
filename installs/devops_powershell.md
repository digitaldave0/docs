# Windows Server devtools setup

### Install Hyper-v Role 

```powershell
 # install Hyper-v Role
 Install-WindowsFeature -Name Hyper-V -ComputerName $env:computername -IncludeManagementTools -Restart
 # list all commands in hyper-v module
 Get-Command -Module hyper-v | Out-GridView
 # get state of running machine
 Get-VM | where {$_.State -eq 'Running'}
 ```
 
 ## Create VM with Hyper-v module
 ```powershell

$VMName = $env:computername   
 $VM = @{
     Name = $VMName
     MemoryStartupBytes = 2147483648
     Generation = 2
     NewVHDPath = "C:\Virtual Machines\$VMName\$VMName.vhdx"
     NewVHDSizeBytes = 53687091200
     BootDevice = "VHD"
     Path = "C:\Virtual Machines\$VMName"
     SwitchName = (Get-VMSwitch).Name
 }
 New-VM @VM
 ```
## Loop Using foreach 
```powershell
$vmhosts = "vm1","vm2","vm3","vm4","vm5"
foreach ($i in $vmhosts){
New-VM -Name $i -MemoryStartupBytes 512mb -NewVHDPath "C:\Virtual Machines\$i.vhdx" -NewVHDSizeBytes 4GB
}               
```
 ## Delete VM
```powershell
 Remove-VM -Name * | where {$_.State -eq 'Off'}
 ```