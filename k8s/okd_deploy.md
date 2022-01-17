# minishift 

## Install 

```bash
curl -LO https://github.com/minishift/minishift/releases/download/v1.34.3/minishift-1.34.3-linux-amd64.tgz
tar -zxvf minishift-1.34.3-linux-amd64.tgz
./minishift --vm-driver kvm --openshift-version latest start
minishift oc-env
export PATH="/home/$USER/.minishift/cache/oc/v3.11.0/linux:$PATH"
eval $(minishift oc-env)
minishift openshift config view
minishift ip
```

```bash
minishift docker-env
eval $(minishift docker-env)

```

## Using oc

```bash
oc login -u system:admin
oc config view
```