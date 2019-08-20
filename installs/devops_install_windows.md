
# Windows 10 devtools setup

### Remove Most of the Unwanted Files

```powershell
write-host "uninstall 3D Builder:"
get-appxpackage *3dbuilder* | remove-appxpackage

write-host "uninstall Alarms & Clock:"
get-appxpackage *alarms* | remove-appxpackage

write-host "uninstall App Connector:"
get-appxpackage *appconnect* | remove-appxpackage

write-host "uninstall App Installer:"
get-appxpackage *appinstaller* | remove-appxpackage

write-host "uninstall Calendar and Mail apps write-hostgether:"
get-appxpackage *communicationsapps* | remove-appxpackage

write-host "uninstall Calculator:"
get-appxpackage *calculator* | remove-appxpackage

write-host "uninstall Camera:"
get-appxpackage *camera* | remove-appxpackage

write-host "uninstall Feedback Hub:"
get-appxpackage *feedback* | remove-appxpackage

write-host "uninstall Get Office:"
get-appxpackage *officehub* | remove-appxpackage

write-host "uninstall Get Started or Tips:"
get-appxpackage *getstarted* | remove-appxpackage

write-host "uninstall Get Skype:"
get-appxpackage *skypeapp* | remove-appxpackage

write-host "uninstall Groove Music:"
get-appxpackage *zunemusic* | remove-appxpackage

write-host "uninstall Groove Music and Movies TV"
get-appxpackage *zune* | remove-appxpackage

write-host "uninstall Maps:"
get-appxpackage *maps* | remove-appxpackage

write-host "uninstall Messaging and Skype Video apps"
get-appxpackage *messaging* | remove-appxpackage

write-host "uninstall Microsoft Solitaire Collection:"
get-appxpackage *solitaire* | remove-appxpackage

write-host "uninstall Microsoft Wallet:"
get-appxpackage *wallet* | remove-appxpackage

write-host "uninstall Microsoft Wi-Fi"
get-appxpackage *connectivity* | remove-appxpackage

write-host "uninstall Money:"
get-appxpackage *bingfinance* | remove-appxpackage

write-host "uninstall Money, News, Sports and Weather"
get-appxpackage *bing* | remove-appxpackage

write-host "uninstall Movies & TV:"
get-appxpackage *zunevideo* | remove-appxpackage

write-host "uninstall News:"
get-appxpackage *bingnews* | remove-appxpackage

write-host "uninstall OneNote:"
get-appxpackage *onenote* | remove-appxpackage

write-host "uninstall Paid Wi-Fi & Cellular:"
get-appxpackage *oneconnect* | remove-appxpackage

write-host "uninstall Paint 3D:"
get-appxpackage *mspaint* | remove-appxpackage

write-host uninstall Phone:
get-appxpackage *commsphone* | remove-appxpackage

write-host uninstall Phone Companion:
get-appxpackage *windowsphone* | remove-appxpackage

write-host uninstall Phone and Phone Companion apps write-hostgether:
get-appxpackage *phone* | remove-appxpackage

write-host "uninstall Phone"
get-appxpackage *phone* | remove-appxpackage

write-host "uninstall Sports:"
get-appxpackage *bingsports* | remove-appxpackage

write-host "uninstall Sticky Notes:"
get-appxpackage *sticky* | remove-appxpackage

write-host "uninstall Sway:"
get-appxpackage *sway* | remove-appxpackage

write-host "uninstall View 3D:"
get-appxpackage *3d* | remove-appxpackage

write-host "uninstall Voice Recorder:"
get-appxpackage *soundrecorder* | remove-appxpackage

write-host "uninstall Weather:"
get-appxpackage *bingweather* | remove-appxpackage

write-host "uninstall Windows Holographic:"
get-appxpackage *holographic* | remove-appxpackage

write-host "uninstall Xbox:"
get-appxpackage *xbox* | remove-appxpackage
```

### List all Packages

```powershell
Get-AppxPackage | Select Name, PackageFullName
```

### remove indvidual apps

```powershell
$a="Microsoft.Windows.Photos_2018.18051.21218.0_x64__8wekyb3d8bbwe"
Get-AppPackage $a | Remove-AppxPackage
```

### Restart & Rename Computer

```powershell
Restart-Computer 
Rename-Computer -ComputerName $env:COMPUTERNAME -NewName "lappy02"
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

### install fedora wsl, vscode, python 3.7, git,  

```command
choco install wsl-fedoraremix
choco install vscode
choco install git.install
choco install python --version 3.7.2
choco install consul
choco install vault
choco install vagrant
choco install packer
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

5. Just click any one which you like to add for quick access from command list.

6. Finally, in the terminal window, just click on + sign next to terminal list

7. 
---

