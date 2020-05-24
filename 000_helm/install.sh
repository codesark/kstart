#!/bin/bash

# install helm
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

# add kubernetes stable repo 
helm repo add stable https://kubernetes-charts.storage.googleapis.com