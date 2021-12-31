# Some helpful commands, in the case of diag:

# Collecting info about cluster:
# Cluster CIDR: 
kubectl cluster-info dump | grep -i cluster-cidr
# Service CIDR: 
kubectl cluster-info dump | grep -i service-cluster-ip-range
# DNS: 
kubectl describe svc/kube-dns -n kube-system


# Get the status / errors
kubectl describe node <node>
kubectl describe deployment <deployment>
kubectl describe service <service>
kubectl describe pod <pod>

# Check the events in case of error
kubectl get events --all-namespaces  --sort-by='.metadata.creationTimestamp'
kubectl get events | grep node





# remove deployment:
kubectl delete deployment <deployment>
kubectl delete service <deployment>

# Reset the cluster or node:
sudo kubeadm reset

# Remove a node from cluster:
kubectl drain <node>  --ignore-daemonsets --delete-local-data
 kubectl delete node <node>

