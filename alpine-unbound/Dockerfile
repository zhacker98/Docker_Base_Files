FROM alpine:3.3

MAINTAINER Philip Miglinci "p.miglinci@gmail.com"

RUN apk add --update unbound ; \
    rm -rf /var/cache/apk/* ;

COPY unbound.conf /etc/unbound/unbound.conf
COPY root.hints /var/unbound/etc/root.hints
COPY root.key /var/unbound/etc/root.key

RUN unbound-checkconf

CMD ["unbound"]

