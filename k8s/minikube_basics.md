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

## kubectl commands
```bash
kubectl -- get pods -A
kubectl 
kubectl version
kubectl get nodes
kubectl get pod
kubectl get services
```
## create deployment
```bash
kubectl create deployment ngnix-depl --image=nginx
kubectl create deployment mongo-depl --image=mongo
kubectl get deployment
kubectl get pod
kubectl get replicaset
kubectl edit deployment ngnix-depl
kubectl logs ngnix-deploymnet-9bf5cf8bd
kubectl logs mongo-depl-5fd6b7d4b4-shn9z
kubectl describe pod  mongo-depl-5fd6b7d4b4-shn9z
kubectl logs mongo-depl-5fd6b7d4b4-shn9z
```
## interact with pod.

```bash
kubectl exec -it mongo-depl-5fd6b7d4b4-shn9z -- bin/bash
kubectl get deployment
kubectl get pod
```
## delete deployment

```bash
kubectl delete deployment mongo-depl
kubectl get pod
kubectl get replicaset
```

## deploy from deployment file

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  labels:
   app: nginx
spec:
  replicas: 2 
  selector: 
   matchLabels:
     app: nginx
  template:
    metadata:
      labels:
        app: nginx 
    spec:
      containers:
      - name: nginx
        image: nginx:1.16
        ports:
        - containerPort: 80
```


```bash
kubectl apply -f nginx-deployment.yaml
kubectl get pod
kubectl get pods -o wide
```