#! /bin/bash

# VAR
BaseDir=$(pwd)
BuildDir=$(find ${BaseDir} -mindepth 1 -maxdepth 1 -type d|grep -v 'docker_backup')

# PRE


# MAIN
for i in ${BuildDir}; do
	echo ">>---- BUILDING ${i} ----<<"
	cd ${i}
	BuildName=$(echo ${i}|cut -d "/" -f4)
	docker build . -t ${BuildName}	
	echo '<<---- FINISHED WITH ${i} ---->>'
	echo '*************'
done



