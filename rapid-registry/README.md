# Setup a private registry with ease

###### Running Initial_setup_and_cert_generation.sh with generate certificates and start a secure registry

### This setup uses an htpasswd file for basic authentication

#### Build:
docker build . -t rapid-registry

#### Run:
docker run -it --rm -p5005:5000 -v`pwd`/auth:/auth rapid-registry

##### Adding Users:
###### On host system
htpasswd -B auth/htpasswd <new_user> # You will be prompted for the password
# Existing htpasswd contains one user newuser with a password of newpassword

###### Inside the registry container
docker exec rapid-registry htpasswd -Bb auth/htpasswd <new_user> <user_pass> 

