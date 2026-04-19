# docker-latex
## 🛠️ Setup
### Install WSL
1. Open Powershell in administrator mode. (right-click and select "Open as administrator")
2. Enter the command.
```shell
wsl --install
```
3. Restart your computer

### Install Docker
Download `Docker Desktop`  
[Get Started with Docker](https://www.docker.com/get-started/)

### Check docker install
```shell
docker --version
```

### clone repository
```shell
mkdir -p docker_ws && cd docker_ws
git clone https://github.com/iHaruruki/docker-latex.git # Clone this repository
```

### Build
```shell
cd docker-latex
```
To build Docker image from this Dockerfile, run the following command.
```shell
# docker image build [OPTIONS] PATH | URL | -
docker image build --tag docker-latex:latest .
```
### To verify the image exists
```shell
docker image ls docker-latex:latest
```
### Check `docker-latex` history information
```shell
docker image history docker-latex:latest
```

## 🎮 Usage
### Start with one line
Execute the following command in the directory where `main.tex` and `main.sh` are located.
**for windows**
```shell
docker container run --rm -v "${PWD}:/work" -w /work iharuruki/docker-latex bash -c "bash ./main.sh"
```
**for Linux/macOS**
```shell
docker container run --rm -v "${pwd}:/work" -w /work iharuruki/docker-latex bash -c "bash ./main.sh"
```
`main.pdf` & `main_min.pdf` is generated in the **build** folder.

## 📌 Debug
#### Enter the container and check.
**for windows (PowerShell) / Linux/macOS**
```shell
# docker container run [OPTIONS] IMAGE [COMMAND] [ARG...]
docker container run --name test -it -v "${PWD}:/work" -w /work docker-latex:latest bash
```
### Exit the container
```bash
exit
```
### Stop container
```shell
# docker container stop [OPTIONS] CONTAINER [CONTAINER...]
docker container stop test
```
### Start a created (stopped) container / 作成済（停止中）のコンテナを起動する
List Docker containers / Dockerコンテナの一覧を表示
```bash
docker container ls -a
```
Start a created container
```shell
# docker container start [OPTIONS] CONTAINER [CONTAINER...]
docker container start test
```
### Check running containers
```bash
docker container ls
```
### Stop the container
```shell
# docker container stop [OPTIONS] CONTAINER [CONTAINER...]
docker container stop test
```
### Remove the container
```shell
# docker container rm [OPTIONS] CONTAINER [CONTAINER...]
docker container rm test
```