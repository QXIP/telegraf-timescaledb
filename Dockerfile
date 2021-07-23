FROM debian:9
ENV TELEGRAF_VERSION 1.13.0

RUN apt update && apt update && apt install -y wget && \
  wget https://telegrafreleases.blob.core.windows.net/linux/telegraf_1.13.0~with~pg-1_amd64.deb && \
  dpkg -i telegraf_1.13.0~with~pg-1_amd64.deb && \
  rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/timescale/outflux/releases/download/0.2.0/outflux_0.2.0_Linux_x86_64.tar.gz && \
  tar zxvf outflux_0.2.0_Linux_x86_64.tar.gz && \
  chmod +x outflux && mv outflux /usr/bin/outflux && \
  rm -rf outflux_0.2.0_Linux_x86_64.tar.gz
  
EXPOSE 8125/udp 8092/udp 8094

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["telegraf"]
