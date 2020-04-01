## Deploy Minishift

### Whats Minishift

Minishift is a tool that helps you run OKD locally by launching a single-node OKD cluster inside a virtual machine. With Minishift you can try out OKD or develop with it, day-to-day, on your local machine. You can run Minishift on the Windows, macOS, and GNU/Linux operating systems.

Learn Minishift [https://www.redhat.com/sysadmin/learn-openshift-minishift]

### Install 

```console
egrep --only-matching --word-regexp 'vmx|svm' /proc/cpuinfo
sudo apt install qemu-kvm libvirt-daemon libvirt-daemon-system
sudo usermod -a -G libvirt $USER
newgrp libvirt
sudo su -

#KVM
curl -L https://github.com/dhiltgen/docker-machine-kvm/releases/download/v0.10.0/docker-machine-driver-kvm-ubuntu18.04 -o /usr/local/bin/docker-machine-driver-kvm$ chmod +x /usr/local/bin/docker-machine-driver-kvm

curl -L https://developers.redhat.com/products/cdk/download/
cp cdk-3.6.0–1-minishift-linux-amd64 /usr/local/bin
ln -sf cdk-3.6.0–1-minishift-linux-amd64 minishift
minishift setup-cdk
#VirtualBox
minishift start --vm-driver=virtualbox.
minishift oc-env
eval $(minishift oc-env)
```