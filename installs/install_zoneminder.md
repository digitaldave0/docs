
> bash script for zoneminder install on ubuntu 18.04 LTS

### notes will created a playbook for this.

```shell
#!/bin/sh
clear
read -p "This script installs Zoneminder 1.32.x on Ubuntu 18.04 AMD64 with LAMP (MySQL) installed...
Press Enter to continue or Ctrl + c to quit" nothing
clear
read -p "You must be logged in as root using sudo su ...
Press Enter to continue or Ctrl + c to quit" nothing
clear
read -p "Next we will add the PPA repository, install and configure the system to run Zoneminder. 
Press enter to continue" nothing
apt install -y software-properties-common
clear
add-apt-repository ppa:iconnor/zoneminder-1.32
apt update
clear
awk '$0="date.timezone = "$0' /etc/timezone >> /etc/php/7.2/apache2/php.ini
clear
apt install -y zoneminder
systemctl enable zoneminder
service zoneminder start
adduser www-data video
a2enconf zoneminder
a2enmod rewrite
chown -R www-data:www-data /usr/share/zoneminder/
service apache2 reload
clear
read -p "Install complete.Press enter to continue" nothing
clear
```