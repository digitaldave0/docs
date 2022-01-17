## Kubernetes

# install minikube

```bash
url -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64\nsudo install minikube-linux-amd64 /usr/local/bin/minikube
minikube start
which minikube
ln -s $(which minikube) /usr/local/bin/kubectl
sudo ln -s $(which minikube) /usr/local/bin/kubectl
minikube kubectl -- get pods -A
minikube status
```

## update minikube

```bash
minikube start --kubernetes-version=latest
```

## Enable Dashboard

```console
minikube addons list
minikube addons enable dashboard
minikube dashboard
minikube dashboard --url
```

## Install cri.o with minikube

```bash
 minikube delete --all
 minikube start --container-runtime=crio
 kubectl get nodes -o wide
```

