# Kubernetes Setup
Repo contains step-by-step installation scripts for the Ingress `(ingress-nginx)` and Certificate Manager `(letsencrypt)` which should work for any cloud Kubernetes Engine like GKE, EKS or DigitalOcean etc.

>Note:
> - Creating Ingress causes the creation of cloud native loadbalancer (which would cost additional charges)
> - This repo installs `Helm3` if not installed on your local machine.

## How To Setup

>Make sure you have `curl` and `kubectl` installed and `kubectl` is configured to be used on your cluster.

Note: This repo installs `Helm3` if not installed.

Clone the Repo and cd into it to get started

```bash
# clone the repo
git clone https://github.com/iamsavinay/kubernetes_setup.git
# cd into cloned directory
cd kubernetes_setup
```

> Important: First of all change the email to your email in `003_letsencrypt-issuer/issuer.yaml` at `line 9`.

Execute the install scripts in each script serially starting from 001, 002, ... etc.

```bash
bash ./000_helm/install.sh
bash ./001_ingress-nginx/install.sh
bash ./002_cert-manager/install.sh
bash ./003_letsencrypt-issuer/install.sh
```

## How to Use 

You can use created `letsencrypt-issuer` and `ingress-nginx` anywhere in your cluster

Example:

```yaml
apiVersion: networking.k8s.io/v1beta1
kind: Ingress
metadata:
  name: ingress-service
  namespace: default # put your namespace here if you need to
  annotations:
    kubernetes.io/ingress.class: nginx # use created nginx ingress
    cert-manager.io/cluster-issuer: "letsencrypt-issuer" # user created issuer
    nginx.ingress.kubernetes.io/ssl-redirect: "true" # force all traffic to https
spec:
  tls:
    - hosts:
        - example.com # hosts pointing to k8s cluster
        - www.example.com
      secretName: example-com-tls
  rules:
    - host: example.com
      http:
        paths:
          - path: /
            backend:
              serviceName: frontend-service
              servicePort: 3000
    - host: www.example.com
      http:
        paths:
          - path: /
            backend:
              serviceName: frontend-service
              servicePort: 3000
```