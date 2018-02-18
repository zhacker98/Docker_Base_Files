#! /bin/bash

#####
#
#	A Script to backup a given docker container
#
#		Written by Joel E White @2018
#
#####

# VAR
Usage='./script <container_name>'
Container=$1

VolumeSkip=$2

VolumeCheck=$(docker inspect --format='{{.Mounts}}' ${Container} |cut -d ' ' -f 2|wc -l)
VolumeList=$(docker inspect --format='{{.Mounts}}' ${Container} |cut -d ' ' -f 2)
VolumeMount=$(docker inspect --format='{{.Mounts}}' ${Container} |cut -d ' ' -f 4|sed 's/^//')

BaseDir=$(pwd)
BackupDir="${BaseDir}/docker_backups"

# PRE
mkdir -p ${BackupDir}

if [ $# -ne "1" ]; then
  echo ${Usage}
  exit
fi

if [ ${VolumeCheck} -lt "1" ]; then
  echo "No volumes associated with ${Container}"
else
  echo "Volumes found, run ./alpine-export.sh ${Container} '${VolumeMount}'"
  echo "Skip Volume Backup? (Y/N)"
  read VolSkip
  if [ ${VolSkip} == "Y" ]; then
    echo "Skipping Volume Backup for ${Container}"
  else
    exit
  fi
fi

# MAIN

docker export ${Container} > ${BackupDir}/${Container}_EXPORT_$(date +%Y-%m-%d).tar



 
