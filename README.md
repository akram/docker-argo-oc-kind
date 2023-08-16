# README
A container image containing cli used for kind and argocd performance testing:
- docker
- argocd
- kubectl
- oc
- kind

## Build

```
docker build . -t docker-argo-oc-kind
```

## Run
```
docker run --net=kind -ti -v /var/run/docker.sock:/var/run/docker.sock docker-argo-oc-kind bash
```


## Usage

Create kind clusters:
```
for i in {5..1}
do
  kind create cluster -nkind$i
done
```

Change `.kube/config` configuration to use internal addresses

```
for i in $( docker ps |grep kindest | cut -f1 -d\ ); do
  ip_address=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $i )
  host_port=$( docker inspect --format '{{ (index (index .NetworkSettings.Ports "6443/tcp") 0).HostPort }}' $i )
  sed -i "s/127.0.0.1:$host_port/$ip_address:6443/g" ~/.kube/config
done
```
