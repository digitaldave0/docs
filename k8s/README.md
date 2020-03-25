# Kubernetes Notes
------------------

## Using microk8s

Check snap is install on ubuntu before moving on.

You can install it with the command below:

``` 
$ sudo apt update
$ sudo apt install snapd
```

Searching for snaps (apps/packages) 


With the snap tool, you can search for available snap apps/packages. To
find Snap packages , use the following command:

``` 
$ snap find <search_text>
```


## Using Ubuntu with https://microk8s.io/

MicroK8s will install a minimal, lightweight Kubernetes you can run and use on practically any machine. It can be installed with a snap:

```console
sudo snap install microk8s --classic --channel=1.17/stable
sudo usermod -a -G microk8s $USER
su - $USER
```

MicroK8s has a built-in command to display its status. During installation you can use the --wait-ready flag to wait for the Kubernetes services to initialise:


```console
microk8s.status --wait-ready
```

MicroK8s bundles its own version of kubectl for accessing Kubernetes. Use it to run commands to monitor and control your Kubernetes. For example, to view your node:


```console
microk8s.kubectl get nodes
microk8s.kubectl get services
```
Create an alias 

```console
alias kubectl='microk8s.kubectl'
```

Deploy an app

```console
microk8s.kubectl create deployment kubernetes-bootcamp --image=gcr.io/google-samples/kubernetes-bootcamp:v1
```

Check status
```console
microk8s.kubectl get pods
```
To start it is recommended to add DNS management to facilitate communication between services. For applications which need storage, the 'storage' add-on provides directory space on the host. These are easy to set up:

```console
microk8s.enable dns storage
```
MicroK8s will continue running until you decide to stop it. You can stop and start MicroK8s with these simple commands:

```console
microk8s.stop
```

```console
microk8s.start
```