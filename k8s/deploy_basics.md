## How to create and deploy simple PODs on a K8s cluster


## Deploy Pods

A Pod is atomic in a K8s cluster,

Create yaml files only using Pod as objects, not using replication sets yet

> example 1

```javascript
apiVersion: v1
kind: Pod
metadata:
  name: myapp-pod
  labels:
    app: myapp
spec:
  containers:
  - name: myapp-container
    image: busybox
    command: ['sh', '-c', 'echo Hello Kubernetes! && sleep 3600']
```

run kubectl to give yaml to k8s api server, and create running pod.

```console
kubectl create -f my test.yml
```
> example 2

```javascript
apiVersion: v1 
kind: Pod 
metadata:
  name: hello-pod
  labels:
    zone: prod
    version: v1
spec:
  containers:
  - name: hello-ctr
    image: nigelpoulton/pluralsight-docker-ci
    ports:
    - containerPort: 8080
```
check pods are running 

```console
kubectl describe pod hello-pod
```
delete pod when done

```console
kubectl delete pods hello-pod
```

## Deploy replication sets

```javascript
apiVersion: v1
kind: ReplicationController
metadata:
  name: hello-world
spec:
  replicas: 5
  selector:
    app: hello-world
  template:
    metadata:
      name: hello-world
      labels:
        app: hello-world
    spec:
      containers:
      - name: hello-world
        image: nigelpoulton/pluralsight-docker-ci
        ports:
        - containerPort: 8080
```

## kubectl commands

```console
kubectl create -f deploy_hello_world_repset_deployment.yaml
kubectl expose rc hello-world --name=hello-svc --target-port=8080 --type=NodePort
kubectl describe svc hello-svc
kubectl get service --all-namespaces
kubectl get rc -o wide
kubectl delete rc hello-world
kubectl get svc
````



