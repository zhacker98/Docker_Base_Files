# Syncthing in a container

## Usage:

### Build:
docker build . -t debian-syncthing

### Run:
docker run -d --name syncthing -p8384:8384 -p22000:22000 debian-syncthing

#### Web GUI is available at http://localhost:8384
###### Obtain the syncthing ID with the following command
###### docker logs syncthing|grep 'My ID'

### Add files with these commands:
docker cp <src_file> syncthing:/root/Sync/

##### Once you add a remote endpoint in the gui, they will start syncing



##### The folder /root/Sync is stored in a Docker Volume so data will remain until the volume is destroyed

##### So if you remove the container, and want the data purged, run the following...
docker container rm -f -v syncthing

###### Otherwise, use 'docker container inspect' to determine the volume name and export the contents
### Or run the following to open a container, and export the contents to a tar in the current working directory
docker run -it --rm --volumes-from syncthing -v$(pwd):/root/Backup/ alpine tar cjf root/Backup/sync_backup.tar.bz2 root/Sync/

