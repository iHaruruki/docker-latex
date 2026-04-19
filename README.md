# docker-latex
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

## 🧑‍💻 Development
### Dockerfileの作成方法
1. `Dockerfile` を作成または編集します。
2. 作成した内容をローカルでビルドして確認します。

```shell
docker image build --tag docker-latex:dev .
```

3. コンテナを起動して必要なコマンドが実行できることを確認します。

```shell
docker run --rm -it docker-latex:dev bash
```

### デバッグの方法
以下のコマンドはリポジトリ直下で実行します。
#### 1) コンテナに入って確認する
**for windows (PowerShell) / Linux/macOS**
```shell
docker run --rm -it -v "${PWD}:/work" -w /work iharuruki/docker-latex bash
```

#### 2) main.sh を詳細表示で実行する
```shell
bash -x ./main.sh
```

#### 3) 生成ファイルを確認する
```shell
ls -la ./build
```

## 🎮 Usage
### Start with one line
**for windows**
```shell
docker run --rm -v "${PWD}:/work" -w /work iharuruki/docker-latex bash -c "bash ./main.sh"
```
**for Linux/macOS**
```shell
docker run --rm -v "${pwd}:/work" -w /work iharuruki/docker-latex bash -c "bash ./main.sh"
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
