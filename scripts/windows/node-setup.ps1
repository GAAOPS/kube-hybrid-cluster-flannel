Rename-Computer "K-C1-WN-..." -Restart

c:\tmp\PrepareNode.ps1 -KubernetesVersion v1.23.1

# If you lost the token, you can get the join command by running this on the master (creating a new token):
# kubeadm token create --print-join-command
kubeadm join master-ip:6443 --token xxxxxxxxx --discovery-token-ca-cert-hash sha256:xxxxxxxxxx

