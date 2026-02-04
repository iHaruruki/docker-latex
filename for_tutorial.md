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

### Change directory
Go to the directory where `main.tex` and `build.sh` are located.
```shell
cd 
```

### `docker container create`
The `docker container create` (or shorthand: docker create) command creates a new container from the specified image, without starting it.
```shell
# docker container create [OPTIONS] IMAGE [COMMAND] [ARG...]
docker container create --name ubuntu2404-latex iharuruki/ubuntu2404-latex:latest
docker container create --name ubuntu2404-latex -v "$(pwd)":/work -w /work iharuruki/ubuntu2404-latex:latest tail -f /dev/null
```
- `-v`: ホストのカレントディレクトリ（`main.tex`, `build.sh` があるディレクトリ）をコンテナ内 `/work` にマウント
- `-w /work`: コンテナ内の作業ディレクトリを `/work` に設定
- `tail -f /dev/null`: 何もせず待ち続けるためのダミーコマンド（あとで `docker exec` するため）

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