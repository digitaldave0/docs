## Install Docker

> Step 1: Update your system Install  

````bash
sudo dnf -y update
````

> Step 2: Add docker repo

````bash
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf config-manager --set-enabled docker-ce-nightly
````


sudo dnf config-manager --set-enabled docker-ce-test
To disable them, replace --set-enabled flag with --set-disabled.

> Step 3: Install the latest Docker Engine on Fedora 30/29/28

````bash
sudo dnf install docker-ce docker-ce-cli containerd.io
sudo systemctl enable --now docker
sudo systemctl status  docker
````

> Setup 4:

The docker group is created, but no users are added to the group. Add your user to this group to run docker commands without sudo.

````bash
sudo usermod -aG docker $(whoami)
````

Logout and Login again to use Docker without sudo. The version of Docker installed can be checked with:

````bash
$ docker version
````

> Step 4: Pull Test docker image
The last step is to test your installation by downloading a test docker container.

````bash
$ docker pull alpine
$ docker run -it --rm alpine /bin/sh
apk update
````