# Linux Devtools Setup

## Add Upgrade to fedora 31

````bash
sudo dnf upgrade --refresh \
sudo dnf update \
sudo dnf system-upgrade download --releasever=31 
sudo dnf system-upgrade reboot 
sudo dnf system-upgrade clean
````

## Install fusion repo.

````bash
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
````

### Install VS Code

````bash 
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update
sudo dnf install code
````

## Install Python 3.7 

````bash
sudo dnf install python37
````

enable venv for python

````bash
python3.7 -m venv venv
. venv/bin/activate
(venv) $ python --version
````


create venv for python projects

````code
 python3 -m venv python-projects
 source python_projects/bin/activate
 ````



## Incremental backup projects folder  

Create Local Backup job for Projects 

You must create a level 0 backup first:

````bash
tar --create --verbose --listed-incremental ./projects --gzip  --exclude-from=projects/backup_exclude.txt \
    --file projects_`date +%F`.tar.gz projects/
````
--exclude-from=projects/backup_exclude.txt 

This archive is called a level 1 backup.

and the next day, this command compress only files changed since the creation of the ./projects.snar:

````bash

$ tar --create --verbose --listed-incremental ./projects.snar --gzip  --exclude-from=projects/backup_exclude.txt \
    --file projects_`date +%F`.tar.gz projects/
````


When you want to restore, put all archive files into a folder and extract each in order of their creation using the --incremental option, something like this:

````bash
for t in projects_2011-10-2*.tar.gz; \
    do tar --verbose --extract --incremental --gzip --file $t; done

````

### <u>Install VPN</u> 

````bash
sudo wget -qnc https://repo.nordvpn.com/yum/nordvpn/centos/noarch/Packages/n/nordvpn-release-1.0.0-1.noarch.rpm
#curl -sO https://repo.nordvpn.com/yum/nordvpn/centos/noarch/Packages/n/nordvpn-release-1.0.0-1.noarch.rpm
sudo dnf install nordvpn-release-1.0.0-1.noarch.rpm
sudo dnf update
sudo dnf install nordvpn
````

Logon to VPN with Paswword

````
nordvpn login
nordvpn connect
````

### <u>Settings</u>

````
nordvpn login - Log in.
nordvpn connect or nordvpn c - Connect to VPN. To connect to specific servers, use nordvpn connect <country_code server_number> (eg. nordvpn connect uk715)
nordvpn disconnect or nordvpn d - Disconnect from VPN.

nordvpn set or nordvpn s - Set a configuration option. Possible options:
nordvpn set cybersec on or off - Enable or disable CyberSec
nordvpn set killswitch on or off - Enable or disable Kill Switch
nordvpn set autoconnect on or off - Enable or disable Autoconnect. You can set a specific server for automatic connection using nordvpn set autoconnect on country_code+server_number. Example: nordvpn set autoconnect on us2435.
nordvpn set protocol udp or tcp - Switch between UDP and TCP protocols
nordvpn set obfuscate on or off - Enable or disable Obfuscated Servers.

nordvpn whitelist add port 22 - Open incoming port 22 (the port number can be different)
nordvpn whitelist remove port 22 - Remove the rule added with the above command
nordvpn settings - See the current settings.
nordvpn status - See the connection status.
nordvpn countries - See the country list.
nordvpn cities - See the city list.
nordvpn groups - See a list of available server groups.
nordvpn logout - Log out.
nordvpn help or nordvpn h - See the list of commands or help for one command.
````

see [Public API For VPN Lists]("https://blog.sleeplessbeastie.eu/2019/02/18/how-to-use-public-nordvpn-api/")

## install wire guard

````root
sudo dnf copr enable jdoss/wireguard
sudo dnf install wireguard-dkms wireguard-tools
nordvpn set technology nordlynx

nordvpn c
````

## Kodi 

````
sudo dnf install -y  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

````