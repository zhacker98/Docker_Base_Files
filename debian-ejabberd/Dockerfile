FROM debian

MAINTAINER Joel E White

RUN apt-get update && apt-get install -y -q ejabberd

VOLUME /etc/ejabberd/

EXPOSE 5222

CMD ejabberdctl foreground
