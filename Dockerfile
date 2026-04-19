FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

# Locales
RUN apt-get update && apt-get install -y language-pack-ja-base language-pack-ja locales && rm -rf /var/lib/apt/lists/* \
	&& localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG=en_US.utf8

# Install TeX Live with CJK support
RUN apt-get update -q && apt-get install -qy \
    texlive-lang-cjk \
    texlive-fonts-recommended \
    texlive-fonts-extra \
    && rm -rf /var/lib/apt/lists/*

# Install related packages
RUN apt-get update -q && apt-get install -qy \
    xdvik-ja \
    gv \
    nkf \
    gnuplot \
    tgif \
    gimp \
    inkscape \
    mimetex \
    latexdiff \
    && rm -rf /var/lib/apt/lists/*

# 作業ディレクトリ
WORKDIR /work

# コンテナ起動時に bash
CMD ["bash"]