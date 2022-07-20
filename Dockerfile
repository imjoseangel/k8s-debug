ARG build_for=linux/amd64

FROM nginx:latest
LABEL maintainer="imjoseangel"

ENV DEBIAN_FRONTEND=noninteractive
RUN echo "APT::Get::Assume-Yes \"true\";" > /etc/apt/apt.conf.d/90assumeyes

RUN apt-get update -y && \
    apt-get install --no-install-recommends -y -q \
    openssl wget curl dnsutils unzip git iputils-ping && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 80
