#https://community.k6.io/t/how-do-i-install-extensions-when-im-running-the-k6-docker-image/2050/3
FROM golang:1.16-alpine as builder
WORKDIR $GOPATH/src/go.k6.io/k6
ADD . .
RUN apk --no-cache add git
# it' s work but deprecated
RUN go get go.k6.io/k6 
#RUN CGO_ENABLED=0 go install -a -trimpath -ldflags "-s -w -X go.k6.io/k6/lib/consts.VersionDetails=$(date -u +"%FT%T%z")/$(git describe --always --long --dirty)" 
#RUN go install -trimpath github.com/k6io/xk6/cmd/xk6@latest
RUN go install go.k6.io/xk6/cmd/xk6@latest
RUN xk6 build --with github.com/avitalique/xk6-file@latest github.com/grafana/xk6-output-prometheus-remote github.com/k6io/xk6-kubernetes

RUN cp k6 $GOPATH/bin/k6

FROM alpine:3.13
RUN apk add --no-cache ca-certificates && \
    adduser -D -u 12345 -g 12345 k6
COPY --from=builder /go/bin/k6 /usr/bin/k6

#no volumes because I initiate those in docker-compose separately, this is just for image
USER 12345
ENTRYPOINT ["k6"]