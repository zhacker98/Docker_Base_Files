# Setup a private registry with ease

### This setup uses an htpasswd file for basic authentication

#### Build:
docker build . -t rapid-registry

#### Run:
docker run -it --rm -p5000:5000 -v`pwd`/auth:/auth rapid-registry

##### Adding Users:
###### On host system
htpasswd -B auth/htpasswd <new_user> # You will be prompted for the password

###### Inside the registry container
docker exec rapid-registry htpasswd -Bb auth/htpasswd <new_user> <user_pass> 

###### The included htpasswd already has two example users, then can be removed and were just a placeholder
