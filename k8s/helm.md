# Helm 

## Install Helm x64

```bash
curl -LO ~/.local/helm/helm.tgz https://get.helm.sh/helm-v3.8.0-rc.1-linux-amd64.tar.gz
tar xf helm-v3.8.0-rc.1-linux-amd64.tar.gz -C /usr/local/bin/helm
```

```bash
helm create phoenixnap
helm install phoenix-chart phoenixnap/ --values phoenixnap/values.yaml
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
helm repo list
helm search hub prometheus
helm show chart phoenixnap/phoenixnap
helm show values phoenixnap/phoenixnap
helm dependency update
helm package phoenixnap
```

