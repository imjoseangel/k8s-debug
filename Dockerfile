ARG build_for=linux/amd64

FROM debian:stable
LABEL maintainer="imjoseangel"

ENV DEBIAN_FRONTEND=noninteractive
RUN echo "APT::Get::Assume-Yes \"true\";" > /etc/apt/apt.conf.d/90assumeyes

RUN apt-get update -y && \
    apt-get install --no-install-recommends -y -q \
    openssl libauthen-pam-perl curl wget libpam-runtime \
    apt-show-versions python unzip git libio-pty-perl \
    dnsutils iputils-ping perl libnet-ssleay-perl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget http://prdownloads.sourceforge.net/webadmin/webmin_1.997_all.deb && \
    dpkg -i webmin_1.997_all.deb && \
    rm webmin_1.997_all.deb

# Run dbt
ENTRYPOINT ["webmin", "start"]
