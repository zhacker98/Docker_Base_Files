# A script to launch a container to export contents of a given volume

### Usage:
##### Determine docker containers you want to backup, as well as the path that the volume is mounted as
###### List Docker Containers
docker container ls --format '{{.Names}}'

###### Determine Volume Infomation
docker container inspect <container_name>|grep -A 10 Mounts

#### Run:
./alpine-export.sh <container_name> '<src_path>' # src_path is in single quotes and omits the preceeding /
