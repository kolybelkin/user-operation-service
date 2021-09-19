# Steps to run minikube
1) `minikube start --vm-driver=hyperkit --memory 12000 --cpus 4 --cni=flannel`
2) to enable ingress use - `minikube addons enable ingress`
3) `minikube dashboard`

# Run all the steps described in [README](environment/README.md)

# Steps to deploy and test the application
1) Apply kuber-manifests/namespace/kolybelkin-ns.yaml to create the namespace: `kubectl apply -f namespace/.`
2) Install postgresql: `helm install common bitnami/postgresql --namespace=kolybelkin` (there is no custom values, default ones are used)
3) Apply other manifests from kuber-manifests: `kubectl apply -f .`
4) Use postman to test all available methods (exported collection can be found in `postman-collection` folder)

# Other useful commands

1) Forward port to localhost - `kubectl port-forward service/prometheus-kube-prometheus-prometheus 9090 -n monitoring`