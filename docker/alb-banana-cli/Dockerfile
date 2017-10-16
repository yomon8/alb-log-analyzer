FROM golang:1.9.1-alpine

ENV ALOGETTAG=v0.4.0
ENV ALOSOLRTAG=v0.2.0

RUN apk add --update bash openssl-dev git

RUN go get github.com/yomon8/aloget/... && \
    cd $GOPATH/src/github.com/yomon8/aloget && \
    git checkout -f $ALOGETTAG && \
    go install ./cmd/...

RUN go get github.com/yomon8/alosolr/... && \
    cd $GOPATH/src/github.com/yomon8/alosolr && \
    git checkout -f $ALOSOLRTAG && \
    go install ./cmd/...

COPY ./docker-entrypoint.sh /root/
RUN chmod +x /root/docker-entrypoint.sh
ENTRYPOINT ["/root/docker-entrypoint.sh"]

