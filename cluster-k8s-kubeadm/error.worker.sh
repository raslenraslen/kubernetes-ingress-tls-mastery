# 1. Réinitialiser Kubernetes
sudo kubeadm reset -f

# 2. Nettoyer le CNI (Flannel)
sudo rm -rf /etc/cni/net.d

# 3. Redémarrer kubelet
sudo systemctl restart kubelet
