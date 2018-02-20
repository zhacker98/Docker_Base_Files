FROM debian

MAINTAINER Joel E White

EXPOSE 5060/udp

RUN apt-get update && apt-get install -y -q sipwitch

RUN sipw

CMD sipw -f
