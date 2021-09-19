## Устройство Istio

Создать неймспейсы для операторов:

```shell script
kubectl apply -f namespaces.yaml
```

### Разворачиваем Jaeger

Jaeger - решение трассировки. Компоненты Istio, такие как: sidecar-контейнер, gateway, отправляют данные запросов в
систему. Таким образом получается полная трассировка запроса.

Добавить репозиторий в Helm:

```shell script
helm repo add jaegertracing https://jaegertracing.github.io/helm-charts
helm repo update
```

Установить оператор, разворачивающий Jaeger:

```shell script
helm install --version "2.19.0" -n jaeger-operator -f jaeger/operator-values.yaml \
jaeger-operator jaegertracing/jaeger-operator
``` 

Развернуть Jaeger:

```shell script
kubectl apply -f jaeger/jaeger.yaml
```

Проверить состояние Jaeger:

```shell script
kubectl get po -n jaeger -l app.kubernetes.io/instance=jaeger
```

Открыть web-интерфейс Jaeger:

```shell script
minikube service -n jaeger jaeger-query-nodeport
```

### Разворачиваем Prometheus

Prometheus - система мониторинга. С помощью неё собираются метрики Service mesh.

Добавить репозиторий в Helm:

```shell script
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add stable https://kubernetes-charts.storage.googleapis.com/
helm repo update
```

Развернуть решение по мониторингу на основе Prometheus:

```shell script
helm install --version "13.7.2" -n monitoring -f prometheus/operator-values.yaml prometheus \
prometheus-community/kube-prometheus-stack
``` 

Проверить состояние компонентов мониторинга:

```shell script
kubectl get po -n monitoring
```

Добавить сервис типа NodePort для прямого доступа к Prometheus и Grafana:

```shell script
kubectl apply -f prometheus/monitoring-nodeport.yaml
```

Открыть web-интерфейс Grafana:

```shell script
minikube service -n monitoring prometheus-grafana-nodeport
```

Открыть web-интерфейс Prometheus:

```shell script
minikube service -n monitoring prom-prometheus-nodeport
```

### Разворачиваем Istio

Istio - Service mesh решение для облачных платформ, использующее Envoy.

Установить оператор, разворачивающий Istio:

```shell script
istioctl operator init --watchedNamespaces istio-system --operatorNamespace istio-operator
```

Развернуть Istio c помощью оператора:

```shell script
kubectl apply -f istio/istio.yaml
```

Проверить состояние Istio:

```shell script
kubectl get all -n istio-system -l istio.io/rev=default
```

### Устанавливаем Kiali

Kiali - доска управления Service mesh

Добавить репозиторий в Helm:

```shell script
helm repo add kiali https://kiali.org/helm-charts
helm repo update
```

Установить Kiali Operator, разворачивающий Kiali

```shell script
helm install --version "1.33.1" -n kiali-operator kiali-operator kiali/kiali-operator
```

Развернуть Kiali:

```shell script
kubectl apply -f kiali/kiali.yaml
```

Проверить состояние Kiali:

```shell script
kubectl get po -n kiali -l app.kubernetes.io/name=kiali
```

Открыть web-интерфейс Kiali:

```shell script
minikube service -n kiali kiali-nodeport
```
