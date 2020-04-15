## How to install Ansible 

> Added more disk space new disk, extended root vg to 100% ubuntu

```shell
sudp su -
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

> Install ansible on ubuntu

```shell
sudo apt update
sudo apt install software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible
sudo apt install sshpass
```

> Install Ansible via pip

```shell
sudo pip install ansible
```

>Add current host to ansible hosts file

```shell
echo -e "192.168.5.172 192.168.5.201" > ~/ansible_hosts
export ANSIBLE_INVENTORY=~/ansible_hosts
```

```shell
#ping all hosts
ansible all -m ping
#Ask for SSH Password
ansible all -m ping --ask-pass -c paramiko
#check inventory
ansible-inventory --graph
```



>Long way

Create ssh server from stratch and copy keys

>Setup SSH on Server
```shell
ssh-keygen -t rsa
ansible all -m copy -a "src=/home/dave/.ssh/id_rsa.pub dest=/tmp/id_rsa.pub" --ask-pass -c ubuntu10
#add public key on remote server as root
ansible all -m shell -a "cat /tmp/id_rsa.pub >> /root/.ssh/authorized_keys" --ask-pass -c ubuntu10 -u root
#copy authorized keys to host
ansible all -m authorized_key -a "user=mike key='{{ lookup('file', '/home/dave/.ssh/id_rsa.pub') }}' path=/home/dave/.ssh/authorized_keys manage_dir=no" --ask-pass -c ubuntu10
```

