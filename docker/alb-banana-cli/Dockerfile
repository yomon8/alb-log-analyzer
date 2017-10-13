FROM golang:1.9.1

ENV ALOGETTAG=v0.4.0
ENV ALOSOLRTAG=v0.0.3

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

