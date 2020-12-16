FROM debian:stable-slim

RUN apt update

RUN export DEBIAN_FRONTEND=noninteractive && apt install -y i3 xserver-xorg xinit xrdp locales stterm

RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen

RUN echo 'LANG="en_US.UTF-8"' > /etc/default/locale

RUN locale-gen

RUN useradd -m -U -s /bin/bash user

RUN echo "exec i3" > /home/user/.xsession

RUN mkdir -p /home/user/.config/i3

COPY i3config /home/user/.config/i3/config

COPY .env /tmp/env

RUN . /tmp/env && printf "%s\n%s" $RDP_PASS $RDP_PASS | passwd user

RUN rm /tmp/env

CMD xrdp && xrdp-sesman && while true; do sleep 12 ; done
