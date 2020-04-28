## Install Ubuntu Server

> Change ip to fixed set hostname

```shell
# edit netplan
sudo vim /etc/netplan/01-netcfg.yaml 
# change file to below
sudo su -
echo -e "# This file describes the network interfaces available on your system
# For more information, see netplan(5).
network:
  version: 2
  renderer: networkd
  ethernets:
    enp0s3:
      dhcp4: no
      dhcp6: no
      addresses: [192.168.5.201/24]
      gateway4:  192.168.5.1
      nameservers:
              addresses: [192.168.5.1, 8.8.8.8, 8.8.4.4]" > /etc/netplan/01-netcfg.yaml
    # apply config with debug
    sudo netplan --debug try
    sudo hostnamectl set-hostname  ubuntu-server
    sudo usermod -aG sudo dave
    sudo apt install ansible
```

#set up ansible inventory to use file
```shell
sudo echo -e "192.168.5.201" > ~/ansible_hosts
export ANSIBLE_INVENTORY=~/ansible_hosts
sudo echo -e 'export ANSIBLE_INVENTORY=/home/dave/ansible_hosts' >> /etc/environment
```

```shell
#ping all hosts
ansible all -m ping
#Ask for SSH Password
ansible all -m ping --ask-pass -c paramiko
#check inventory
ansible-inventory --graph
```
    
> Add more disk space new disk, extended root vg to 100% ubuntu

```shell
sudo su -
#scan for new disk
lvmdiskscan
#create new pv
pvcreate /dev/sdb 
#scan again
lvmdiskscan -l
#extend new pv to existing lv
vgextend ubuntu-vg /dev/sdb
#extend lv root to 100%
lvm lvextend -l +100%FREE  /dev/ubuntu-vg/ubuntu-lv
#resize filesystem in root lv
resize2fs -p /dev/mapper/ubuntu-vg/ubuntu-lv
#check 
df -h 
```

> Backup project files

```shell
$ tar --create --verbose --listed-incremental ./projects.snar --gzip  --exclude-from=projects/backup_exclude.txt \
    --file projects_`date +%F`.tar.gz projects/
```

> Restore Project Files

When you want to restore, put all archive files into a folder and extract each in order of their creation using the --incremental option, something like this:

```shell
for t in projects_2011-10-2*.tar.gz; \
    do tar --verbose --extract --incremental --gzip --file $t; done
```
> adding vm addtions

```shell
sudo apt install linux-headers-$(uname -r) build-essential dkms
sudo /media/$USER/VBox_GAs*/VBoxLinuxAdditions.run
```
> adding docker server

```shell
# add common 
sudo apt install apt-transport-https ca-certificates curl software-properties-common
# add docker repo
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update
# check correct vesion of docker pulled from above
apt-cache policy docker-ce
# install docker
sudo apt install docker-ce
sudo systemctl status docker
# add account to group
sudo usermod -aG docker ${USER}
# logout sesion check
id -nG
# check running pull test image
docker info
docker run hello-world
```
```shell
#neofetech
sudo apt install neofetch
# install vscode
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install code
```
