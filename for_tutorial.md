### `docker image pull`
To download a particular image, or set of images (i.e., a repository), use `docker pull`.
```shell
# docker image pull [OPTIONS] NAME[:TAG|@DIGEST]
docker image pull iharuruki/ubuntu2404-latex
```

### `docker image ls`
To verify the image exists
```shell
docker image ls iharuruki/ubuntu2404-latex
```

### `docker container create`
The `docker container create` (or shorthand: docker create) command creates a new container from the specified image, without starting it.
```shell
# docker container create [OPTIONS] IMAGE [COMMAND] [ARG...]
docker container create --name ubuntu2404-latex iharuruki/ubuntu2404-latex:latest
```
### `docker container ls -a`
List Docker containers.
```shell
# docker container ls [OPTIONS]
docker container ls -a
```

### `docker container start`
Start a created container.
```shell
docker container start ubuntu2404-latex
```