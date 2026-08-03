# Module : Kubernetes Monitoring & Observability with Prometheus & Grafana

A production-grade observability architecture deployed on Kubernetes using the official `kube-prometheus-stack` Helm chart.

## 🏗️ Observability Stack Architecture

- **Prometheus Operator:** Orchestrates scrape configurations using Custom Resource Definitions (CRDs).
- **Prometheus Server:** Time-series database scraping metrics from cluster endpoints.
- **Grafana:** Visualisation engine with auto-provisioned Kubernetes dashboards.
- **Kube-State-Metrics:** Listens to the Kubernetes API server and reports object health (Pods, Deployments, Nodes).
- **Node Exporter:** Collects host hardware and system metrics.

## 🚀 Quick Deployment Guide

### 1. Set Kubernetes Context & Create Namespace
```bash
kubectl config use-context docker-desktop
kubectl create namespace monitoring


2. Deploy via Helm
helm repo add prometheus-community [https://prometheus-community.github.io/helm-charts](https://prometheus-community.github.io/helm-charts)
helm repo update
helm install prometheus-stack prometheus-community/kube-prometheus-stack --namespace monitoring

3. Access Grafana
# Decode Admin Password
kubectl get secret --namespace monitoring prometheus-stack-grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo

# Port Forward to Local Browser
kubectl port-forward -n monitoring svc/prometheus-stack-grafana 3000:80

Open http://localhost:3000 (Username: admin).

PromQL Querying
Custom PromQL query used in Code mode to aggregate CPU usage per pod:
sum(rate(container_cpu_usage_seconds_total{namespace="monitoring"}[5m])) by (pod)
