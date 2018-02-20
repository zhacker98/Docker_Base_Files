# Container to run SIPwitch

### Usage:

#### Build:
docker build . -t debian-sipwitch

#### Run:
docker run -d -p5060:5060/udp debian-sipwitch

#### Modify:
docker run -it --volumes-from debian-sipwitch alpine sh
  
  $ apk add --update vim
  
  $ vim /etc/sipwitch.conf
