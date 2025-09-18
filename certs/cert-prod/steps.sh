kubectl create namespace cert-manager

kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.12.0/cert-manager.crds.yaml
# Tu peux ajuster la version v1.12.0 si tu souhaites une version plus récente, mais c'est une version stable.



kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.12.0/cert-manager.yaml
# Utilise la même version que pour les CRDs

kubectl get pods -n cert-manager -w


mkdir -p ~/tutenv/cert-manager-config
cd ~/tutenv/cert-manager-config
vi letsencrypt-clusterissuer.yaml


kubectl apply -f letsencrypt-clusterissuer.yaml

kubectl get clusterissuer letsencrypt-prod -o yaml



kubectl get svc ingress-nginx-controller -n ingress-nginx -o jsonpath='{.status.loadBalancer.ingress[0].ip}'