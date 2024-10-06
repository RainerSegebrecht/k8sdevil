# microk8s
https://microk8s.io/ \
https://microk8s.io/docs/working-with-kubectl \
https://microk8s.io/docs/addon-dashboard \
https://www.linkedin.com/pulse/9-steps-enable-kubernetes-dashboard-microk8s-hendri-t \
https://microk8s.io/docs/addons \
https://microk8s.io/docs/addon-host-access \

## Install
`sudo snap install microk8s --classic`


## Check state
`sudo microk8s status --wait-ready`

## Set up kubectl Access for k9s

`babelfisk@babelfisk-T47s:~/.kube$ pwd` \
`/home/babelfisk/.kube` \
`babelfisk@babelfisk-T47s:~/.kube$ sudo microk8s config > config` \

## Enable k8s Dashboard
`sudo microk8s enable dashboard` \
`sudo microk8s kubectl describe secret -n kube-system microk8s-dashboard-token` \
`sudo microk8s kubectl port-forward -n kube-system service/kubernetes-dashboard 10443:443` \

## Enable community addons for cilium

`sudo microk8s enable community` \
`sudo microk8s status` \
`sudo microk8s enable cilium` \
`sudo microk8s cilium hubble enable` \

## Start/Stop Cluster

`sudo microk8s stop` \
`sudo microk8s start` \

LoadBalancer

sudo microk8s enable ingress metallb
...
Enter each IP address range delimited by comma (e.g. '10.64.140.43-10.64.140.49,192.168.0.105-192.168.0.111'): 10.0.0.1-10.0.1.0

sudo microk8s kubectl -n ingress get svc
NAME      TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)                      AGE
ingress   LoadBalancer   10.152.183.32   10.0.0.1      80:31488/TCP,443:31948/TCP   18s

/etc/hosts
10.0.0.1        mk8s.local

