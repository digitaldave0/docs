
# Install minikube
------------------

## Install below first
```console
sudo apt-get update -y 
sudo apt-get install apt-transport-https
sudo apt-get upgrade 
sudo apt install virtualbox virtualbox-ext-pack
```


## Install minikube
```console
wget https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube-linux-amd64
sudo mv minikube-linux-amd64 /usr/local/bin/minikube
``` 

## Install kubectl
```console
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
mv ./kubectl /usr/local/bin/kubectl
kubectl version -o json 
 ```

## Start minikube check config
```console
minikube start
kubectl config view
```
## Check cluster
```console
kubectl cluster-info
```

## Check running nodes
```console
kubectl get nodes
```

Kubernete ships with a web dashboard which allows you to manage your cluster without interacting with a command line. The dashboard addon is installed and enabled by default on minikube.

## Enable Dashboard

```console
minikube addons list
minikube dashboard
minikube dashboard --url
```

