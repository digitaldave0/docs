# Using kompose to convert docker compose files into declarative yaml files

```console
To convert the docker-compose.yml file to files that you can use with kubectl, run kompose convert and then kubectl apply -f <output file>.

kompose convert

see output

WARN Volume mount on the host "/data/jenkins" isn't supported - ignoring path on the host 
WARN Volume mount on the host "/var/run/docker.sock" isn't supported - ignoring path on the host 
WARN Ignoring user directive. User to be specified as a UID (numeric). 
INFO Kubernetes file "jenkins-service.yaml" created 
INFO Kubernetes file "jenkins-deployment.yaml" created 
INFO Kubernetes file "jenkins-claim0-persistentvolumeclaim.yaml" created 
INFO Kubernetes file "jenkins-claim1-persistentvolumeclaim.yaml" created 
```

## to send yaml files to kubernetes api-server

see 

```console
kubectl apply -f <output file>
```