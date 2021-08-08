# Steps to deploy
1) Apply kuber-manifests/namespace/kolybelkin-ns.yaml to create the namespace: `kubectl apply -f namespace/.`
2) Install postgre: `helm install common bitnami/postgresql --namespace=kolybelkin`
3) Apply other manifests from kuber-manifests: `kubectl apply -f .`
4) Use `curl <kubectl get service>/otusapp/kolybelkin/<method name> -H "Host: arch.homework"`
    - Available methods
        - TBD