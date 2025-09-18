kubectl delete secret bookinfo-tls -n default --ignore-not-found=true

kubectl apply -f ~/tutenv/ingress/bookinfo-ingress.yaml