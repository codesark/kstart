#!/bin/bash

# Create namespace
kubectl create namespace nginx

# Helm install ingress-nginx in 'ingress-nginx' namespace
helm install ingress-nginx ingress-nginx/ingress-nginx --set rbac.create=true -n nginx
