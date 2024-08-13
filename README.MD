# How to build yocto docker image
## Build local
```
cd /path/to/folder/contain/Dockerfile
docker build -t hvbon2010/docker_yocto_linux_6:latest .
```

## Get image from docker hub
`docker pull hvbon2010/docker_yocto_linux_6:latest`

# Build docker container
`./build_yocto_container.sh`

# Execute to the docker container
`docker exec -it yocto_container_linux6_$USER bash`

# How to release the new docker image to github docker
We need to add a new release of this github repository.

And the github action will be triggered to build and push docker image to docker hub with release tag.

https://hub.docker.com/repository/docker/hvbon2010/docker_yocto_linux_6/general
