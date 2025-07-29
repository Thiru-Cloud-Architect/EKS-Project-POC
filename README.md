# EKS Microservices Project

This is an end-to-end microservices deployment stack using AWS EKS, Terraform, Helm, and GitHub Actions CI/CD.

## Structure

- `terraform/`: VPC, IAM roles, and EKS cluster provisioning
- `helm-charts/`: Base Helm setups like Ingress, Cert Manager, and Monitoring
- `k8s-manifests/`: Application-level Kubernetes objects
- `.github/workflows/`: GitHub Actions pipeline to deploy on commit

## Setup Instructions

1. **Provision Infrastructure**
```bash
cd terraform/vpc && terraform apply
cd ../iam && terraform apply
cd ../eks && terraform apply
```

2. **Install Helm Charts**
```bash
helm upgrade --install ingress-nginx helm-charts/ingress-nginx
helm upgrade --install cert-manager helm-charts/cert-manager
helm upgrade --install prometheus-grafana helm-charts/prometheus-grafana
```

3. **Deploy Microservices**
```bash
kubectl apply -f k8s-manifests/
```

4. **Enable GitHub Actions**
Push changes to the `main` branch to trigger the pipeline in `.github/workflows/deploy.yml`.

## Monitoring
- Prometheus and Grafana deployed using Helm
- Access Grafana at `/grafana` on the Ingress hostname

## Service Discovery
- Kubernetes native (CoreDNS)
- Services communicate via `service.namespace.svc.cluster.local`

---

Happy shipping! 
