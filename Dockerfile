FROM ilharp/qqnt:0.0.3-windows-amd64-up9.9.0.14569

ARG CHRONOCAT_VERSION

RUN apt update && \
  \
  # 安装依赖
  apt install -y wget unzip && \
  \
  # 下载 LiteLoaderQQNT
  cd '/wine/drive_c/Program Files/Tencent/QQNT/resources/app' && \
  wget https://github.com/LiteLoaderQQNT/LiteLoaderQQNT/releases/download/0.5.3/LiteLoaderQQNT.zip && \
  # 安装 LiteLoaderQQNT
  unzip LiteLoaderQQNT.zip && \
  rm LiteLoaderQQNT.zip && \
  sed -i 's/.\/app_launcher\/index.js/.\/LiteLoader/' package.json && \
  \
  # 下载 Chronocat
  mkdir -p /root/LiteLoaderQQNT/plugins && \
  cd /root/LiteLoaderQQNT/plugins && \
  wget https://github.com/chrononeko/chronocat/releases/download/${CHRONOCAT_VERSION}/chronocat-llqqnt-${CHRONOCAT_VERSION}.zip && \
  # 安装 Chronocat
  unzip chronocat-llqqnt-${CHRONOCAT_VERSION}.zip && \
  rm chronocat-llqqnt-${CHRONOCAT_VERSION}.zip && \
  \
  # 清理
  apt purge -y wget unzip && \
  apt autoremove -y && \
  apt clean && \
  rm -rf \
  /var/lib/apt/lists/* \
  /tmp/* \
  /var/tmp/*
