#!/bin/bash
# This script allows you to restore a single volume from a container
# Data in restored in volume with same backupped path
NEW_CONTAINER_NAME=$1

usage() {
  echo "Usage: $0 [container name]"
  exit 1
}

if [ -z $NEW_CONTAINER_NAME ]
then
  echo "Error: missing container name parameter."
  usage
fi

sudo docker run -rm --volumes-from $NEW_CONTAINER_NAME -v $(pwd):/backup busybox tar xvf /backup/backup.tar

exit
# explicit exit to stop the script
Usage can be like this:

$ volume_backup.sh old_container /srv/www
$ sudo docker stop old_container && sudo docker rm old_container
$ sudo docker run -d --name new_container myrepo/new_container
$ volume_restore.sh new_container
Assumptions are: backup file is named backup.tar, it resides in the same directory as backup and restore script, volume name is the same between containers.

UPDATE

It seems to me that backuping volumes from containers is not different from backuping volumes from data containers.

Volumes are nothing else than paths linked to a container so the process is the same.

I don't know if docker-backup works also for same container volumes but you can use:

sudo docker run -rm --volumes-from yourcontainer -v $(pwd):/backup busybox tar cvf /backup/backup.tar /data
and:

sudo docker run -rm --volumes-from yournewcontainer -v $(pwd):/backup busybox tar xvf /backup/backup.tar
END UPDATE

There is this nice tool available which lets you backup and restore docker volumes containers:

https://github.com/discordianfish/docker-backup

if you have a container linked to some container volumes like this:

$ docker run --volumes-from=my-data-container --name my-server ...
you can backup all the volumes like this:

$ docker-backup store my-server-backup.tar my-server
and restore like this:

$ docker-backup restore my-server-backup.tar
Or you can follow the official way:

How to port data-only volumes from one host to another?

shareimprove this answer
edited May 23 at 12:02

Community♦
11
answered Oct 13 '14 at 12:19

tommasop
14.5k13247
  	 	
No it's not a "--volumes-from" situation, rather the volumes are defined in the dockerfile which is what causes the data to not persist. If you look at the dockerfile for tutum/lamp you will see what I mean. – pguardiario Oct 13 '14 at 22:20
  	 	
The answer I already gave is good for any kind of volume because volumes are volumes and containers are containers there is no difference if you use a container as a data container from a volumes perspective – tommasop Oct 14 '14 at 7:34 
  	 	
The volume that's defined in the dockerfile is destroyed when the container is destroyed. So there's no way to get that data back when you move the container. – pguardiario Oct 14 '14 at 9:10
  	 	
you have to get the data out before moving the container then relaunch the container and put the data back – tommasop Oct 14 '14 at 12:28
  	 	
Right, so in other words, no there's no simple way to move a container that declares volumes in the dockerfile. – pguardiario Oct 14 '14 at 23:49
show 3 more comments

## EXCERPT FROM https://stackoverflow.com/questions/26331651/how-can-i-backup-a-docker-container-with-its-data-volumes
