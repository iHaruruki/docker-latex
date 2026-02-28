FROM ubuntu:24.04

LABEL maintainer="Haruki Isono<haruki.isono861@gmail.com>"

# Upgrade OS
RUN apt-get update -q && \
    DEBIAN_FRONTEND=noninteractive apt-get upgrade -y && \
    apt-get autoclean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/*

# locale
RUN apt-get update && apt-get install -y --no-install-recommends \
    locales \
 && locale-gen ja_JP.UTF-8 \
 && update-locale LANG=ja_JP.UTF-8 \
 && rm -rf /var/lib/apt/lists/*

ENV LANG=ja_JP.UTF-8
ENV LC_ALL=ja_JP.UTF-8

# Install LaTex packages
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    texlive-full \
    ghostscript \
    poppler-data \
    gsfonts \
    poppler-utils \
    ca-certificates \
    fonts-ipafont \
    fonts-ipaexfont \
    fonts-noto-cjk \
 && rm -rf /var/lib/apt/lists/*

# build.sh をイメージにコピーして実行する
# COPY build.sh /usr/local/bin/build.sh
# RUN chmod +x /usr/local/bin/build.sh

# 作業ディレクトリ
WORKDIR /work

# コンテナ起動時に bash
CMD ["bash"]