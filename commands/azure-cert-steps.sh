kubectl create namespace test
cd app-test-2
kubectl apply -f angular-app-deployment.yaml -n test

kubectl apply -f angular-app-service.yaml -n test
kubectl get pods -n test -l app=online-boutique-frontend -w

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.10.0/deploy/static/provider/cloud/deploy.yaml


kubectl get pods -n ingress-nginx -w

kubectl patch svc ingress-nginx-controller -n ingress-nginx -p '{"spec": {"type": "LoadBalancer"}}'


# Étape 3 : Configurer un VRAI Nom de Domaine pour l'Application


nslookup rasleneboutique.duckdns.org