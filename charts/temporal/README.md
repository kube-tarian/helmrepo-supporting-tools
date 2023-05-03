##  Temporal
### Prerequisites
- k8ssandra

#### pre-installation setup
Copy the secret from k8ssandra-operator namespace to temporal namespace
```sh
kubectl get secret temporal-superuser --namespace=k8ssandra-operator -o yaml | sed 's/namespace: .*/namespace: temporal/' | kubectl apply -f -
```
### Intallation
Note: when installing it for the first set the values for schema create and update to true in values/values.cassandra.yaml file, once the installation is complete set them to false for subsequent releases. Here is the values stanza for reference.
```yaml
schema:
  setup:
    enabled: true
  update:
    enabled: true
```
```sh
helm install -f values.yaml -f values/values.cassandra.yaml -n temporal temporal .
```
