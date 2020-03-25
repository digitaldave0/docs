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