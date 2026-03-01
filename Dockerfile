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

# コンテナ起動時に bash
CMD ["bash"]