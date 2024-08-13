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
