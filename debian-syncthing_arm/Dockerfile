FROM debian

MAINTAINER Joel E White "Joel E White"

RUN apt-get update && apt-get install -y -q tar wget vim curl

RUN cd /root/ && wget https://github.com/syncthing/syncthing/releases/download/v0.14.44/syncthing-linux-arm-v0.14.44.tar.gz && tar -xf /root/syncthing-linux-arm-v0.14.44.tar.gz

EXPOSE 8384 22000

VOLUME /root/Sync

CMD /root/syncthing-linux-arm-v0.14.44/syncthing -gui-address=0.0.0.0:8384


