#! /bin/bash

#####
#
#	A Script to run an Alpine Linux container and export the contents of a volume to tar
#
#		Written by Joel E White @2018
#
#####

# VAR
Usage="./script <originating_container> '<src_path>' #src_path less the leading / "
OrigContainer=$1
SrcPath=$2

# PRE
if [ $# -ne "2" ]; then
  echo ${Usage}
  exit
fi

# MAIN

docker run -it --rm --volumes-from ${OrigContainer} -v$(pwd):/root/Backup/ alpine tar cjf root/Backup/${OrigContainer}_backup-$(date +%Y-%m-%d).tar.bz2 ${SrcPath}




