FROM archlinux:latest


# Gerekyi paketleri yükle
RUN pacman -Syyu --noconfirm \
    aria2 \
    curl \
    chromium \
    ffmpeg \
    figlet \
    gcc \
    git \
    jq \
    libevent \
    libffi \
    libjpeg \
    libpng \
    libpqxx \
    libsystemd \
    libwebp \
    libxml2 \
    libxslt \
    linux-headers \
    musl \
    neofetch \
    nss \
    openssl \
    postgresql \
    postgresql-client \
    python3 \
    python-pip \
    pv \
    sudo \
    tzdata \
    util-linux \
    wget  


# Repoyu klonla ve çalışma dizinini hazırla
RUN git clone https://github.com/Quiec/AsenaUserBot /root/asena
RUN mkdir /root/asena/bin/
WORKDIR /root/asena/


# Oturum ve yapılandırmayı kopyala (varsa)
COPY ./sample_config.env ./userbot.session* ./config.env* /root/asena/


# Zaman dilimini ayarla
ENV TZ=Europe/Istanbul


# Gerekli pip modüllerini kur
RUN pip3 install -r requirements.txt


# Botu çalıştır
CMD ["python3","main.py"]
