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

## Enable Dashboard

```console
minikube addons list
minikube addons enable dashboard
minikube dashboard
minikube dashboard --url
```