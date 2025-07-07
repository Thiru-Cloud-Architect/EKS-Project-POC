# EKS Microservices Project

This project demonstrates a full CI/CD setup using AWS EKS, Terraform, GitHub Actions, and Helm.

## 🔧 Structure

```
eks-microservices-project/
├── terraform/
│   ├── vpc/
│   ├── eks/
│   └── iam/
├── helm-charts/
│   ├── ingress-nginx/
│   ├── cert-manager/
│   └── prometheus-grafana/
├── k8s-manifests/
│   ├── frontend/
│   ├── backend/
│   └── database/
├── .github/workflows/
│   └── deploy.yml
└── README.md
```

## 🛠 Setup Instructions

1. **Terraform Setup:**
```bash
cd terraform/vpc && terraform apply
cd ../iam && terraform apply
cd ../eks && terraform apply
```

2. **Helm Installations:**
```bash
helm install ingress-nginx helm-charts/ingress-nginx
helm install cert-manager helm-charts/cert-manager
helm install prometheus-grafana helm-charts/prometheus-grafana
```

3. **Kubernetes Deployment:**
```bash
kubectl apply -f k8s-manifests/
```

4. **CI/CD:**
Push to `main` triggers GitHub Actions deploy pipeline.

## 📊 Monitoring and Ingress

- Ingress: `ingress-nginx`
- SSL: `cert-manager`
- Monitoring: `prometheus-grafana`

---

Built for learning and real-world use. 🚀
