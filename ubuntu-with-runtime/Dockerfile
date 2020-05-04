FROM ubuntu:bionic

ENV DEBIAN_FRONTEND=noninteractive
RUN rm /etc/dpkg/dpkg.cfg.d/excludes &&\
        apt-get update &&\
        apt-get -y --no-install-recommends install dnsutils wget apt-transport-https software-properties-common &&\
        rm -r /var/lib/apt/lists/*

RUN wget https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb &&\
        dpkg -i packages-microsoft-prod.deb &&\
        add-apt-repository universe && \
        apt-get update && apt-get -y install apt-transport-https && \
        apt-get update && apt-get -y install aspnetcore-runtime-3.1 && \
        rm -rf /var/lib/apt/lists/*

