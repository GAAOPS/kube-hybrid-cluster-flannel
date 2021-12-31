# correct the hostname
sudo nano /etc/hostname 

# correct the host entry
sudo nano /etc/hosts

sudo reboot

#####################################################
# Initialize the cluster
sudo kubeadm init --pod-network-cidr=10.240.0.0/16

# if something went wrong you can simply reset it:
# sudo kubeadm reset

# note down the join command

# Copy the configs:
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config


##########################################################
# Flannel setup:
# download the config:
wget https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

nano kube-flannel.yml

# Edit the net-conf section
# make sure you use the same cidr that used in cluster init command
# make sure the backend type ist host-gw

# net-conf.json: |
#   {
#     "Network": "10.240.0.0/16",
#     "Backend": {
#       "Type": "host-gw"
#     }
#   }

# apply the flannel config:
kubectl apply -f kube-flannel.yml

# check if the pods starts correctly:
kubectl get pods -n kube-system

# add windows compatible version: make sure you use the correct kube version (1.23.1)
curl -L https://github.com/kubernetes-sigs/sig-windows-tools/releases/latest/download/kube-proxy.yml | sed 's/VERSION/v1.23.1/g' | kubectl apply -f -
# apply the config:
kubectl apply -f https://github.com/kubernetes-sigs/sig-windows-tools/releases/latest/download/flannel-host-gw.yml

# configure rolling update:
kubectl get ds/kube-proxy -o go-template='{{.spec.updateStrategy.type}}{{"\n"}}' --namespace=kube-system

# check the selectors:
kubectl get ds -n kube-system

