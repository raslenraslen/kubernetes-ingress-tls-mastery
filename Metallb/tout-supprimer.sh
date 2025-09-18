# Supprimer le service nginx exposé
kubectl delete svc nginx-test

# Supprimer le déploiement nginx
kubectl delete deployment nginx-test

# Supprimer les ressources MetalLB custom (IPAddressPool et L2Advertisement)
kubectl delete -f ipaddresspool.yaml
kubectl delete -f l2advertisement.yaml

# Supprimer MetalLB (manifeste complet)
kubectl delete -f https://raw.githubusercontent.com/metallb/metallb/main/config/manifests/metallb-native.yaml

# Supprimer le secret MetalLB
kubectl delete secret -n metallb-system memberlist

# Supprimer le namespace MetalLB
kubectl delete ns metallb-system
