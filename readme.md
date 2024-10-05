
# microk8s

## Install
`sudo snap install microk8s --classic`


## Check state
`sudo microk8s status --wait-ready`

## Set up kubectl Access for k9s

`babelfisk@babelfisk-T47s:~/.kube$ pwd`
`/home/babelfisk/.kube`
`babelfisk@babelfisk-T47s:~/.kube$ sudo microk8s config > config`

## Enable k8s Dashboard
`sudo microk8s enable dashboard`

`sudo microk8s kubectl describe secret -n kube-system microk8s-dashboard-token`

`sudo microk8s kubectl port-forward -n kube-system service/kubernetes-dashboard 10443:443`

## Enable community addons for cilium

`sudo microk8s enable community`

`sudo microk8s status`

`sudo microk8s enable cilium`

`sudo microk8s cilium hubble enable`


## Start/Stop Cluster

`sudo microk8s stop`

`sudo microk8s start`

