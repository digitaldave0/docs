#Docker Notes

## Build Project

```console
docker-compose up -d
```
## Check Build is running

```console
docker-compose ps
```

## Clean up 

```console
docker-compose down
docker-compose down --volumes
```

## Remove Images for docker hub
```console
read -s USERNAME
read -s PASSWORD
read -s ORGANIZATION
read -s REPOSITORY
echo $USERNAME
echo $ORGANIZATION
echo $REPOSITORY
curl -u $USERNAME:$PASSWORD -X "DELETE" https://cloud.docker.com/v2/repositories/$ORGANIZATION/$REPOSITORY/tags/$TAG/
```

## Remove all Images


```console
docker rmi -f $(docker images -a -q)
```

## openshift 

Using minishift

minishift start --vm-driver=virtualbox

----

Building local code changes

```console
oc login --get token
oc get projects.
oc project <name>

#create a new build for application

oc new-build --strategy docker --binary --docker-image centos:centos7 --name myapp

#Start a binary build using the local directory’s content

oc start-build myapp --from-dir . --follow

#Deploy the application using new-app, then create a route for it:

oc new-app myapp
oc expose svc/myapp

#Get the host name for your route and navigate to it:

oc get route myapp
```
