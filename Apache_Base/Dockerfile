FROM ubuntu:latest
MAINTAINER Scott P. Gallagher <email@somewhere.com>
RUN apt-get update && apt-get install -y apache2
EXPOSE 80
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"] 
