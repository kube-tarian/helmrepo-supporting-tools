## K8ssandra Operator 
### Prerequisites
- Helm 3.x
- cluster with minimum of 4 nodes.
### Intallation
#### Add Helm repo
```bash
helm repo add k8ssandra https://helm.k8ssandra.io/stable
helm repo update
```
#### Install the operator
```sh
kubectl create namespace k8ssandra-operator 
helm upgrade --install k8ssandra-operator k8ssandra/k8ssandra-operator -n k8ssandra-operator
```
#### Install the k8ssanra cluster
Installing the operator creates a CRD K8ssandraCluster that can be used to create Highly available cassandra cluster. Create the cluster with the following command.
```sh
kubectl apply -f cluster.yaml
```
