#!/bin/bash

# Kubernetes 1.15+

# Install the CustomResourceDefinition resources separately.
kubectl apply --validate=false -f https://github.com/jetstack/cert-manager/releases/download/v0.16.1/cert-manager.crds.yaml
kubectl create namespace cert-manager

helm repo add jetstack https://charts.jetstack.io
helm repo update

helm install \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --version v0.14.2
