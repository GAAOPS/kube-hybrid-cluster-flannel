# kube-hybrid-cluster-flannel
Setup a On-Prem mixed windows & linux cluster with Kubernetes and flannel (hosted gateway).

Explanation can be found on the Youtube: 

[Setup a On-Prem Kubernetes cluster with Flannel using Hyper-V with Windows and Linux Nodes](https://www.youtube.com/watch?v=sN3nCMhQgKI)

Steps:
- Creating base VM template for linux nodes
- Create / Init Master Nodes
- Configure Flannel with hosted gateway
- Create base VM Template for Windows node
- Join Windows worker nodes to the cluster
- Join Linux worker nodes to the cluster
- Test Deployment
- Verify the connectivity between linux/windows pods & nodes
- Some useful commands & tips at the end for diagnostics

If you face an issue you can check the repositories issues listed in reference section, for example:

https://github.com/kubernetes-sigs/sig-windows-tools/issues/103


References:

- [Cluster Networking](https://kubernetes.io/docs/concepts/cluster-administration/networking/#flannel)
- [Windows in Kubernetes](https://kubernetes.io/docs/setup/production-environment/windows/)
- [Administration with kubeadm](https://kubernetes.io/docs/tasks/administer-cluster/kubeadm/)
- [SIG Windows Tools](https://github.com/kubernetes-sigs/sig-windows-tools)
- [flannel](https://github.com/flannel-io/flannel)