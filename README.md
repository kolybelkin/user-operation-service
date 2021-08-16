# Steps to run minikube
1) `minikube start --vm-driver=hyperkit --memory 12000 --cpus 4`
2) to enable ingress use - `minikube addons enable ingress`
3) `minikube dashboard`

# Steps to deploy and test
1) Apply kuber-manifests/namespace/kolybelkin-ns.yaml to create the namespace: `kubectl apply -f namespace/.`
2) Install postgresql: `helm install common bitnami/postgresql --namespace=kolybelkin` (there is no custom values, default ones are used)
3) Apply other manifests from kuber-manifests: `kubectl apply -f .`
4) Use postman to test all available methods (exported collection can be found in `postman-collection` folder)

# Install prometheus

1) `helm repo add prometheus-community https://prometheus-community.github.io/helm-charts`
2) `helm repo add stable https://charts.helm.sh/stable`
3) `helm repo update`
4) `helm install prometheus prometheus-community/kube-prometheus-stack -f prometheus.yaml --namespace=monitoring --atomic`

# Apply prometheus manifests

1) `kubectl apply -f ./kuber-manifests/prometheus-grafana/.`