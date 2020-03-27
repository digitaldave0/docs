## How to create and deploy simple PODs on a K8s cluster

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