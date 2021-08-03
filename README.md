# Steps to deploy
1) Apply kuber-manifests/namespace/kolybelkin-ns.yaml to create the namespace
2) Apply other manifests from kuber-manifests
3) Use `curl <server ip>/otusapp/kolybelkin/<method name> -H "Host: arch.homework"`
    - Available methods
        - TBD