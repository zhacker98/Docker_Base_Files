# Scripts to backup docker container

## Usage:

### Backup Container -
./container_backup.sh <container_name>

#### If a volume is found, the command to backup the volume is presented

### Backup Volume -
./alpine-export.sh <container_name> '<src_path>' #src_path less the leading /


###### The following directory will be created below the current working directory
./docker_backups/

###### All backups will be stored in the above directory
