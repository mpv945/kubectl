FROM alpine:latest

MAINTAINER xiehaijun <zhenxindefeng@126.com>

ARG KUBE_VERSION="v1.17.3"

RUN apk add --update ca-certificates \
 && apk add --update -t deps curl \
 && apk add --update gettext \
 && apk add --update git \
 && curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
 && chmod +x /usr/local/bin/kubectl \
 && apk del --purge deps \
 && rm /var/cache/apk/*
 

 ENTRYPOINT ["kubectl"]
 CMD ["--help"]
