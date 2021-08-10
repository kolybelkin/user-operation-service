# Steps to deploy and test
1) Apply kuber-manifests/namespace/kolybelkin-ns.yaml to create the namespace: `kubectl apply -f namespace/.`
2) Install postgresql: `helm install common bitnami/postgresql --namespace=kolybelkin` (there is no custom values, default ones are used)
3) Apply other manifests from kuber-manifests: `kubectl apply -f .`
4) Use postman to test all available methods (exported collection can be found in `postman-collection` folder)