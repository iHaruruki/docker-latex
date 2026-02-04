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
git clone https://github.com/iHaruruki/docker-ubuntu-latex.git
```
### Build
```shell
cd latex_docker
```
To build Docker image from this Dockerfile, run the following command.
```shell
# docker image build [OPTIONS] PATH | URL | -
docker image build --tag ubuntu2404-latex .
```
### To verify the image exists
```shell
docker image ls ubuntu2404-latex
```
### Check `ubuntu2404-latex` history information
```shell
docker image history ubuntu2404-latex
```
### Starting the container
```shell
# docker run --name [CONTAINER NAME] -p <ホスト側のポート>:<コンテナ側のポート> --security-out 
docker container run --name ubuntu2404-latex ubuntu2404-latex:latest
```
> [!NOTE]
> When getting a Docker image from Docker Hub  
> Docker HubからDocker imageを取得する場合  
> `docker container run --name ubuntu2404-ros2 -p 6080:80 --security-opt seccomp=unconfined --shm-size=512m ubuntu2404-latex:latest`

## 🎮 Usage
### Start a created (stopped) container / 作成済（停止中）のコンテナを起動する
List Docker containers / Dockerコンテナの一覧を表示
```bash
docker container ls -a
```
Start a created container
```shell
# docker container start [CONTAINER ID]
docker container start ubuntu2404-latex
```
### Check running containers
```bash
docker container ls
```
### Stop the container
```shell
# docker container stop [CONTAINER ID]
docker container stop ubuntu2404-latex
```
### Remove the container
```shell
# docker container rm [CONTAINER ID]
docker container rm ubuntu2404-latex
```