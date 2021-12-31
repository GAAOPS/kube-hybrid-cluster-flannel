# make sure everything is up-to-date
sudo apt-get update -y && sudo apt-get upgrade -y

# install docker and net tools (you need only docker)
sudo apt install docker.io watch ipvsadm ipset tcpdump net-tools apt-transport-https curl -y

# add google gpg keys
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

# Add the Kubernetes repository
sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"

# install kubernetes components
sudo apt-get install -y kubelet kubeadm kubectl
# Install Kubernetes components:
sudo apt-mark hold kubelet kubeadm kubectl

# turn of the swap
sudo sed -i "/\b\(swap\)\b/d" /etc/fstab
cat /etc/fstab
sudo swapoff -a
# 
# make sure this line is deleted : /swap.img       none    swap    sw      0       0
# or use sudo nano /etc/fstab


# let ubuntu see the bridge traffic
cat <<EOF | sudo tee /etc/sysctl.d/99-kubernetes-cri.conf
net.bridge.bridge-nf-call-iptables  = 1
EOF

# Apply sysctl params without reboot
sudo sysctl --system


# Make sure docker uses the correct driver
cat <<EOF | sudo tee /etc/docker/daemon.json
{
    "exec-opts": ["native.cgroupdriver=systemd"]
}
EOF

 sudo systemctl daemon-reload
 sudo systemctl restart docker
