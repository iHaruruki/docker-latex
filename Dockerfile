FROM texlive/texlive:latest

# Upgrade OS
RUN apt-get update -q && \
    DEBIAN_FRONTEND=noninteractive apt-get upgrade -y && \
    apt-get autoclean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/*

# Install LaTex packages
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    ghostscript \
    poppler-utils \
&& rm -rf /var/lib/apt/lists/*

# 作業ディレクトリ
WORKDIR /work

# ビルドスクリプトをイメージに組み込む (main.sh must exist in the build context)
COPY main.sh /usr/local/bin/main.sh
RUN chmod +x /usr/local/bin/main.sh

# コンテナ起動時にビルドスクリプトを実行する
CMD ["bash", "/usr/local/bin/main.sh"]