FROM alpine:3.3

RUN apk add --update coreutils curl
 
RUN adduser -D dockerauth \
  && apk add --update -t build-group git go wget \
  && GOPATH=/tmp go get github.com/cesanta/docker_auth/... \
  && mv /tmp/bin/auth_server /auth_server \
  && rm -rf /tmp/* \
  && apk del build-group \
  && rm -rf /var/cache/apk/*
 
COPY config /config

RUN chown -R dockerauth: /config
USER dockerauth
EXPOSE 5001
 
CMD ["dockerauth", "/auth_server", "-logtostderr", "/config/config.yml"]


