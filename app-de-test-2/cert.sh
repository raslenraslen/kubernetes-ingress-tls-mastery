export DOMAIN_NAME_BOUTIQUE="boutique.kube.local"

echo "[ req ]
default_bits = 2048
prompt = no
default_md = sha256
req_extensions = req_ext
distinguished_name = dn

[ dn ]
C = FR
ST = IleDeFrance
L = Paris
O = MyTestOrg
OU = K8sLab
CN = boutique.kube.local

[ req_ext ]
subjectAltName = @alt_names

[ alt_names ]
DNS.1 = boutique.kube.local" > boutique-san.cnf


openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -keyout $DOMAIN_NAME_BOUTIQUE.key -out $DOMAIN_NAME_BOUTIQUE.crt -config boutique-san.cnf -extensions req_ext


kubectl create secret tls boutique-tls \
  --cert=$DOMAIN_NAME_BOUTIQUE.crt \
  --key=$DOMAIN_NAME_BOUTIQUE.key \
  -n test 

  kubectl get secret boutique-tls -n test


  kubectl apply -f boutique-ingress.yaml -n test

  kubectl get ingress -n test

  kubectl delete pod -n ingress-nginx -l app.kubernetes.io/component=controller