
# Windows 10 devtools setup

### Remove Most of the Unwanted Files

```powershell
list out packages to be removed
$a = Get-AppxPackage -AllUsers | where-object {$_.IsFramework -eq $false -And $_.name -notlike "*store*" -And $_.name -notlike "*calc*" -And $_.SignatureKind -eq "Store"} | select Name
Get-AppxPackage -AllUsers | where-object {$_.IsFramework -eq $false -And $_.name -notlike "*store*" -And $_.name -notlike "*calc*" -And $_.SignatureKind -eq "Store"} | Remove-AppxPackage -whatif
```

### Restart & Rename Computer

```powershell
$myname "lappy02" 
Restart-Computer 
Rename-Computer -ComputerName $env:COMPUTERNAME -NewName $myname
Write-Host $env:COMPUTERNAME
```

## Register 

```command
$ip = '192.168.2.248'
$key = '<?THEKEY>'
slmgr.vbs /ipk $key
slmgr.vbs /skms 192.168.5.248:1688
slmgr.vbs /ato
```

## install chocolatey

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

## Upgrade chocolatey

```command
choco upgrade chocolatey
choco feature enable -y allowGlobalConfirmation
```

## Install Choco Packages  

```powershell
$devpackages = @("virtualbox","packer","vagrant","notepadplusplus","terraform","terraform-docs","git.install") `
$devpackages | % {choco install $_ -y} `
refreshenv
```


```
#useful choco packages list
choco install wsl -y
choco install wsl-ubuntu -y
choco install vscode -y
choco install notepadplusplus -y
choco install git.install
choco install python --version 3.7.2 -y
choco install virtualbox -y
choco install vagrant -y
choco install packer -y
choco install sysinternals -y
choco install sysintern -y
```

### Fix sharing ssh key after WSL is working 

```bash
git config --global user.name  ""
git config --global user.email ""
git config --global core.autocrlf false
git config --global --edit
cd ~
mkdir .ssh
chmod 700 .ssh
cd .ssh
cp /mnt/c/Users/user/.ssh/id_rsa* .
chmod 600 id_rsa
chmod 644 id_rsa.pub
git config --list --show-origin
```


### Checking for error codes with choco and powershell example
```powershell
$exitCode = $LASTEXITCODE

Write-Verbose "Exit code was $exitCode"
$validExitCode

s = @(0, 1605, 1614, 1641, 3010)
if ($validExitCodes -contains $exitCode) {
Exit 0
}

Exit $exitCode
```

### Adding changes to vscode config

edit config.json file in vscode add below

```json
// Command Prompt
"terminal.integrated.shell.windows": "C:\\Windows\\System32\\cmd.exe"
// PowerShell
"terminal.integrated.shell.windows": "C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe"
// Git Bash
"terminal.integrated.shell.windows": "C:\\Program Files\\Git\\bin\\bash.exe"
// Bash on Ubuntu (on Windows)
"terminal.integrated.shell.windows": "C:\\Windows\\System32\\bash.exe"
```

Then follow below.

1. Open terminal, it should be visible (use ctrl+` or from menu View-> Integrated Terminal )

2. Open commands search (use Ctrl+Shift+P or from menu View->Command Palette...)

3. In command box Type "Terminal: Select Default Shell" to select this option from drop down box

4. As you select this option, then all the available commands which are in path will be listed

5. Just click any one which you like to add or quick access from command list.

6. Finally, in the terminal window, just click on + sign next to terminal list

7. 

### upgrade choco
```command
choco upgrade wsl -y --source="'http://internal/odata/repo'
```

### dism convert install.esd to install.wim 
```
#list index
dism /Get-WimInfo /WimFile:"C:\new folders\sources\install.esd"
# convert encypted esd to wim format to use 
C:\Windows\system32> dism /Export-Image /SourceImageFile:"C:\new folders\sources\install.esd" /SourceIndex:6 /DestinationImageFile:"C:\new folders\sources\install.wim" /Compress:Max /CheckIntegrity
```

---

