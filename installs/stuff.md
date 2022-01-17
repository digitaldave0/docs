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
kubectl create deployment ngnix-deploy --image=nginx
kubectl get deployment
kubectl get pod
kubectl get replicaset
kubectl edit deployment ngnix-deploY
kubectl logs ngnix-deploymnet-9bf5cf8bd
```

kubectl create deployment mongo-depl --image=mongo
kubectl get pod
kubectl logs mongo-depl-5fd6b7d4b4-shn9z
kubectl describe pod  mongo-depl-5fd6b7d4b4-shn9z
kubectl logs mongo-depl-5fd6b7d4b4-shn9z
clear
gett pod
kubectl get pod
kubectl exec -it mongo-depl-5fd6b7d4b4-shn9z -- bin/bash
kubectl get deployment
kubectl get pod
kubestl delete deployment mongo-depl
kubectl delete deployment mongo-depl
kubectl get pod
kubectl get replicaset
kubectl apply -f nginx-deployment.yaml
touch nginx-deployment.yaml
vi nginx-deployment.yaml
kubectl apply -f nginx-deployment.yaml
vi nginx-deployment.yaml
kubectl apply -f nginx-deployment.yaml
vi nginx-deployment.yaml
kubectl apply -f nginx-deployment.yaml
vi nginx-deployment.yaml
kubectl apply -f nginx-deployment.yaml
kubectl get pod
kubectl delete deployment ngnix-deploymnet-9bf5cf8bd-4tbk7
kubectl get replicase
`kubectl get pods -o wid`