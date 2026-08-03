# 🏆 Enterprise DevSecOps Capstone Project

An end-to-end containerized microservice architecture built with automated DevSecOps CI/CD, Trivy container security scanning, Kubernetes deployment, and Prometheus observability.

---

## 🏗️ Architecture Overview

[ Node.js API ] ➔ [ GitHub Actions CI/CD ] ➔ [ Trivy Security Scan ]
│
[ Prometheus Observability ] ◄─ [ K8s Deployment & Service ]

---

## ⚙️ Key Technical Features

1. **Microservice API (`capstone/app/`):**
   - Built on Node.js & Express.
   - Native `/health` probe endpoint for Kubernetes liveness/readiness checks.
   - Built-in `/metrics` endpoint using `prom-client` to expose raw Prometheus metrics.

2. **Automated DevSecOps Pipeline (`.github/workflows/devops-pipeline.yml`):**
   - Automated triggers on `push` or `pull_request` to `main`.
   - Node.js dependency validation & build job.
   - Multi-stage Docker container build with **Aqua Security Trivy** scanning for High/Critical vulnerability detection.

3. **Kubernetes Deployment & Telemetry (`capstone/k8s/`):**
   - Multi-replica Deployment (2 pods) with automated health probes.
   - Embedded Pod Annotations (`prometheus.io/scrape`) for Prometheus metrics scraping.
   - Clean `ClusterIP` Service exposing port `80` routed to container port `8080`.

---

## 🚀 Deployment Instructions

### 1. Build Container Image
```bash
cd capstone/app
docker build -t capstone-api:v1 .

2. Apply Kubernetes Manifests
cd ../k8s
kubectl apply -f deployment.yaml

3. Verify Deployment & Route Traffic
kubectl get pods -l app=capstone-api
kubectl port-forward svc/capstone-api-service 8080:80

4. Test Endpoints
Health Check: curl http://localhost:8080/health
Metrics Endpoint: curl http://localhost:8080/metrics
