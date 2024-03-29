# Linux Devtools Setup

> Add Upgrade to fedora 31

````bash
sudo dnf upgrade --refresh \
sudo dnf update \
sudo dnf system-upgrade download --releasever=31 
sudo dnf system-upgrade reboot 
sudo dnf system-upgrade clean
````

> Install fusion repo.

````bash
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
````

> Install VS Code

````bash 
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update
sudo dnf install code
````

> Incremental backup projects folder  

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

> copy ssh key

````bash
cat ~/.ssh/id_rsa.pub | ssh <user>@<hostname> 'umask 0077; mkdir -p .ssh; cat >> .ssh/authorized_keys && echo "Key copied"'
````
> cut history

```bash
history 25 > file.log
cat file.log | cut -c 8-
```
> Ubuntu Docker install

```bash
echo "installing docker"
sudo apt install apt-transport-https ca-certificates curl gnupg lsb-release -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
"deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
sudo groupadd docker
sudo usermod -aG docker $USER
```

