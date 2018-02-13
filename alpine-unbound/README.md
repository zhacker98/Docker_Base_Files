Based on this document

https://pmig.at/2016/01/16/host-your-own-7mb-dns-server-with-docker-alpine-linux-and-unbound/


More good documentation

https://wiki.alpinelinux.org/wiki/Setting_up_unbound_DNS_server
https://www.unbound.net/documentation/index.html


------------

Mod to suit your environments needs

-------------

USAGE:

  docker build . -t alpine-unbound
  
  docker run -d --name local-unbound-dns -p53:53/udp alpine-unbound
  
  

