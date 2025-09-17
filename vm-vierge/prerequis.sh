sudo chown -R raslen:raslen ~/tutenv

kubectl taint nodes raslen node-role.kubernetes.io/control-plane:NoSchedule-


kubectl port-forward --address 0.0.0.0 svc/productpage 9080:9080
