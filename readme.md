# microk8s
https://microk8s.io/ \
https://microk8s.io/docs/working-with-kubectl \
https://microk8s.io/docs/addon-dashboard \
https://www.linkedin.com/pulse/9-steps-enable-kubernetes-dashboard-microk8s-hendri-t \
https://microk8s.io/docs/addons \
https://microk8s.io/docs/addon-host-access \



## Install
`sudo snap install microk8s --classic`

## Install specific k8s version
https://microk8s.io/docs/setting-snap-channel \ 


### list versions
'snap info microk8s' \

'sudo snap install microk8s --classic --channel=1.29/stable' \

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

## LoadBalancer metallb
`sudo microk8s enable ingress metallb` \
... \
`Enter each IP address range delimited by comma (e.g. '10.64.140.43-10.64.140.49,192.168.0.105-192.168.0.111'): 10.0.0.1-10.0.1.0` \

### loadbalancer ingress
`sudo microk8s kubectl apply -f ingress.yml` \

#### check loadbalancer external-ip
`sudo microk8s kubectl -n ingress get svc` \
`NAME      TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)                      AGE` \
`ingress   LoadBalancer   10.152.183.32   10.0.0.1      80:31488/TCP,443:31948/TCP   18s` \

#### Loadbalancer external-IP in /etc/hosts eintragen
`/etc/hosts` \
`10.0.0.1        mk8s.local` \

### Test-Loadbalancer mit external IP

#### deploy services
`sudo microk8s kubectl apply -f service-1.yml ` \
`  deployment.apps/service1 created` \
`  service/service1 created` \
`sudo microk8s kubectl apply -f service-2.yml` \
`  deployment.apps/service2 created` \
`  service/service2 created` \
`sudo microk8s kubectl apply -f service-3.yml` \
`  deployment.apps/service3 created` \
`  service/service3 created` \

#### check services from external
`curl -H "Host: api.mysite.net" http://mk8s.local/hello` \
`curl -H "Host: api.myothersite.net" http://mk8s.local/service2/hello` \
`curl -H "Host: api.myothersite.net" http://mk8s.local/service3/hello` \