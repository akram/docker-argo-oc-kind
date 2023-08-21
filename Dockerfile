FROM docker
RUN apk update && apk add curl bash net-tools
WORKDIR /bin
RUN curl                https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest/openshift-client-linux-arm64-4.13.9.tar.gz | tar zxvf -
RUN curl -sSL -o kind   https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-arm64
RUN curl -sSL -o argocd https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
RUN chmod +x /bin/argocd /bin/kind
