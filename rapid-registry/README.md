# Setup a private registry with ease

### This setup uses an htpasswd file for basic authentication

#### Build:
docker build . -t rapid-registry

#### Run:
docker run -it --name rapid-registry --restart=always -p5000:5000 -v$(pwd)/auth:/auth rapid-registry

##### Adding Users:
###### On host system
htpasswd -B auth/htpasswd <new_user> # You will be prompted for the password

###### Inside the registry container
docker exec rapid-registry htpasswd -Bb auth/htpasswd <new_user> <user_pass> 

###### The included htpasswd already has two example users, then can be removed and were just a placeholder

#### Issues with connecting to the registry via 'docker login http://my.rapid-registry.domain:5000'
#### If so, you may need to modify the client docker configuration
##### After docker 1.12, you will need to add the following to /etc/docker/daemon.json or create the file if it does not exist
{ "insecure-registries":["<your_registry>:5000"] }
