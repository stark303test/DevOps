#!/bin/bash
# Master node
sudo kubeadm init --pod-network-cidr=192.168.0.0/16 --ignore-preflight-errors=all 
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
sudo su
export KUBECONFIG=/etc/kubernetes/admin.conf
exit
kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.27.3/manifests/tigera-operator.yaml 
kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.27.3/manifests/custom-resources.yaml 
