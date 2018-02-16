## A Docker Container to test out you Sinatra App anywhere you can run docker

# Build:
docker build . -t sinatra-improv

# Run:

docker run -it --name sintatra-improv -p4567:4567 sinatra-improv -- This will launch the output in the foreground
 
#### Run the following to background you container output

docker run -d --name sintatra-improv -p4567:4567 sinatra-improv 

#### Then run the following to watch the output of the app

docker container logs -f sinatra-improv

### To Cleanup

#### Run the following to remove the container and image of your improv app

docker container rm -f sinatra-improv && docker image rm -f sinatra-improv
