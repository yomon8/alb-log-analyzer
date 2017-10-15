FROM golang:1.9.1-alpine

ENV ALOGETTAG=v0.4.0
ENV ALOSOLRTAG=v0.1.1

RUN apk add --update bash openssl-dev git

RUN go get github.com/yomon8/aloget/... && \
    cd $GOPATH/src/github.com/yomon8/aloget && \
    git checkout -f $ALOGETTAG && \
    go install ./cmd/...

RUN go get github.com/yomon8/alb-log-analyzer/alosolr/... && \
    cd $GOPATH/src/github.com/yomon8/alb-log-analyzer/alosolr && \
    git checkout -f $ALOSOLRTAG && \
    go install ./cmd/...

COPY ./docker-entrypoint.sh /root/
RUN chmod +x /root/docker-entrypoint.sh
ENTRYPOINT ["/root/docker-entrypoint.sh"]

