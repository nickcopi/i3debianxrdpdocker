FROM debian:sid-slim

RUN apt-get update

RUN export DEBIAN_FRONTEND=noninteractive && apt install -y i3 xserver-xorg xinit xrdp locales stterm  vim tmux iproute2 procps sudo #chromium

RUN export DEBIAN_FRONTEND=noninteractive && apt install -y firefox

#RUN echo 'chromium --no-sandbox --user-data-dir=$HOME' > /usr/bin/chrome

#RUN chmod +x /usr/bin/chrome

RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen

RUN echo 'LANG="en_US.UTF-8"' > /etc/default/locale

RUN locale-gen

RUN useradd -m -U -s /bin/bash user

RUN usermod -aG sudo user

RUN echo "exec i3" > /home/user/.xsession

RUN mkdir -p /home/user/.config/i3

COPY i3config /home/user/.config/i3/config

COPY init.sh /init.sh

CMD /init.sh
