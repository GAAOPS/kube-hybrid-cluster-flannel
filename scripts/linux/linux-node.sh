# correct the hostname
sudo nano /etc/hostname 

# correct the host entry
sudo nano /etc/hosts

sudo reboot

# use the join command:
# If you lost the token, you can get the join command by running this on the master (creating a new token):
# kubeadm token create --print-join-command
kubeadm join master-ip:6443 --token  --discovery-token-ca-cert-hash sha256:

