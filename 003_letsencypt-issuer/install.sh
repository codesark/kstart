#!/bin/bash

# fetch the current directory of script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# install issuer
kubectl apply -f $DIR/issuer.yaml --namespace cert-manager