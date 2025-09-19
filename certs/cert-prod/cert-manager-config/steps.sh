mkdir -p ~/tutenv/cert-manager-config
cd ~/tutenv/cert-manager-config

kubectl create namespace cert-manager 
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.12.0/cert-manager.crds.yaml 

kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.12.0/cert-manager.yaml 
kubectl get pods -n cert-manager -w 

vi letsencrypt-prod-clusterissuer.yaml

kubectl apply -f letsencrypt-prod-clusterissuer.yaml

kubectl get clusterissuer letsencrypt-prod