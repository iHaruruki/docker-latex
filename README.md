# docker-ubuntu-ros2
## 🛠️ Setup
### Install Docker
Download `Docker Desktop`  
[Get Started with Docker](https://www.docker.com/get-started/)

### Check docker install
```shell
docker --version
```
### clone repository
```shell
cd .\Documents\
git clone https://github.com/iHaruruki/docker-latex.git
```
### Build
```shell
cd docker-latex
```
To build Docker image from this Dockerfile, run the following command.
```shell
# docker image build [OPTIONS] PATH | URL | -
docker image build --tag docker-latex .
```
### To verify the image exists
```shell
docker image ls docker-latex
```
### Check `docker-latex` history information
```shell
docker image history docker-latex
```

## 🎮 Usage
### Start with one line
The container automatically runs `main.sh` to build the PDF.  
**for windows**
```shell
docker run --rm -v "${PWD}:/work" -w /work iharuruki/docker-latex
```
**for Linux/macOS**
```shell
docker run --rm -v "${pwd}:/work" -w /work iharuruki/docker-latex
```

### Start a created (stopped) container / 作成済（停止中）のコンテナを起動する
List Docker containers / Dockerコンテナの一覧を表示
```bash
docker container ls -a
```
Start a created container
```shell
# docker container start [CONTAINER ID]
docker container start docker-latex
```
### Check running containers
```bash
docker container ls
```
### Stop the container
```shell
# docker container stop [CONTAINER ID]
docker container stop docker-latex
```
### Remove the container
```shell
# docker container rm [CONTAINER ID]
docker container rm docker-latex
```