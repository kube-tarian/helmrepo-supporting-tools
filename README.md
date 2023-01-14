# helmrepo-supporting-tools
Maintain Helm Charts for the tools we support via Capten


#### Tools Installation
```bash
helm repo add tools https://kube-tarian.github.io/helmrepo-supporting-tools
helm repo update

helm upgrade -i traefik tools/traefik -n traefik
```

