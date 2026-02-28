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
    poppler-utils \
    poppler-data \
    gsfonts \
    ca-certificates \
    fonts-ipafont \
    fonts-ipaexfont \
    fonts-noto-cjk \
    fonts-noto-cjk-extra \
    dos2unix \
&& rm -rf /var/lib/apt/lists/*

# デフォルトの日本語フォント（IPAexフォント）をPDFに埋め込む設定
RUN kanji-config-updmap-sys ipaex

# platex のラッパー: エラーと警告を色付けし、エラー時に停止する
RUN echo '#!/bin/bash' > /usr/local/bin/platex && \
    echo '/usr/bin/platex -halt-on-error "$@" | grep --color=always -E "^!.*|Error|Warning|$"' >> /usr/local/bin/platex && \
    echo 'exit ${PIPESTATUS[0]}' >> /usr/local/bin/platex && \
    chmod +x /usr/local/bin/platex

# dvipdfmx のラッパー: 存在しない .map ファイルが指定されたら空ファイルを作ってエラーを回避
RUN echo '#!/bin/bash' > /usr/local/bin/dvipdfmx && \
    echo 'for arg in "$@"; do if [[ "$arg" == *.map ]] && [[ ! -f "$arg" ]]; then touch "$arg"; fi; done' >> /usr/local/bin/dvipdfmx && \
    echo '/usr/bin/dvipdfmx "$@"' >> /usr/local/bin/dvipdfmx && \
    chmod +x /usr/local/bin/dvipdfmx

# gs のラッパー: 圧縮時にフォントの埋め込みを強制する
RUN echo '#!/bin/bash' > /usr/local/bin/gs && \
    echo '/usr/bin/gs -dEmbedAllFonts=true -dSubsetFonts=true "$@"' >> /usr/local/bin/gs && \
    chmod +x /usr/local/bin/gs

# rm のラッパー: .bbl などファイルが存在しないときのエラー出力を消す (-f を強制付与)
RUN echo '#!/bin/bash' > /usr/local/bin/rm && \
    echo '/bin/rm -f "$@"' >> /usr/local/bin/rm && \
    chmod +x /usr/local/bin/rm

# build.sh をイメージにコピーして実行する
# COPY build.sh /usr/local/bin/build.sh
# RUN chmod +x /usr/local/bin/build.sh

# 作業ディレクトリ
WORKDIR /work

# コンテナ起動時に bash
CMD ["bash"]