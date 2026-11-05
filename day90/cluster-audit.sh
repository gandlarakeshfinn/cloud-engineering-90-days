#!/bin/bash
echo "=========================================================="
echo "    CLOUD ENGINEERING 90-DAY GRADUATION CLUSTER AUDIT     "
echo "=========================================================="
echo "Date: $(date)"
echo "Node: $(kubectl get nodes -o jsonpath='{.items[0].metadata.name}')"
echo "K3s Status: $(kubectl get nodes -o jsonpath='{.items[0].status.conditions[?(@.type=="Ready")].status}')"
echo "----------------------------------------------------------"
echo "[1] Active Namespaces:"
kubectl get ns
echo "----------------------------------------------------------"
echo "[2] Resource Quotas Enforced:"
kubectl get resourcequotas -A
echo "----------------------------------------------------------"
echo "[3] Helm Releases Deployed:"
helm list -A
echo "----------------------------------------------------------"
echo "[4] Production & Dev Pod Health:"
kubectl get pods -n dev
kubectl get pods -n prod
echo "=========================================================="
echo "           90-DAY CURRICULUM 100% COMPLETED!             "
echo "=========================================================="
