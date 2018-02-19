#! /bin/bash

# VAR
DomainName=$1

Usage='./script <domain_name>'

if [ $# -ne "1" ]; then
  echo ${Usage}
  exit
fi

BaseDir="$(pwd)"
AuthDir="${BaseDir}/auth"
AuthCheck="$(ls ${AuthDir}/htpasswd|wc -l)"
CertDir="${BaseDir}/certs"
CertCheck="$(ls ${CertDir}|wc -l)"

CertGen="openssl req \
  -newkey rsa:4096 -nodes -sha256 -keyout certs/domain.key \
  -x509 -days 365 -out certs/domain.crt"

# PRE
## Add necessary directories
mkdir -p ${AuthDir}
mkdir -p ${CertDir}

## Check for auth folder
if [ ${AuthCheck} -ne "1" ]; then
  echo 'No Auth Directory Found'
  mkdir -p $(pwd)/auth
  echo 'Run the following the create user entries'
  echo 'htpasswd -Bc auth/htpasswd <new_user>'
  echo "<<---- Please re-run this script after you create the htpasswd file under $(pwd)/auth ---->>" 
  exit
fi

## Generate self signed certs
if [ ${CertCheck} -lt "2" ]; then
  echo 'No Certs Exist'
  ${CertGen}
else
  echo 'Certs Already Exist'
  echo 'Would you like to exit? Y/N?'
  read CertCont
  if [ ${CertCont} == "N" ]; then
    echo 'Proceeding with Initial Cert creation'
    ${CertGen}
  else
    echo 'Exiting the script'
    exit
  fi
fi


# MAIN

## Starting Docker Container

echo "Starting Docker Registry Container for - ${DomainName}"
sleep 2

docker run -d --restart=always --name registry-${DomainName} -v`pwd`/auth:/auth -e "REGISTRY_AUTH=htpasswd" -e "REGISTRY_AUTH_HTPASSWD_REALM=Registry Realm" -e REGISTRY_AUTH_HTPASSWD_PATH=/auth/htpasswd -v $(pwd)/certs:/certs -e REGISTRY_HTTP_ADDR=0.0.0.0:443 -e REGISTRY_HTTP_TLS_CERTIFICATE=/certs/domain.crt -e REGISTRY_HTTP_TLS_KEY=/certs/domain.key -p 443:443 registry:2

## Checking that container is running

echo "Showing running registry for - ${DomainName}"
docker container ps -l

echo
echo "You will need to copy the domain.crt from ${AuthDir} to all clients using the registry"
echo "rsync -avz ${AuthDir}/domain.crt <user>@<host>:/etc/docker/certs.d/<registry_fqdn>:<port>/client.crt"
echo "The /etc/docker/certs.d/ directory may need to be created"
