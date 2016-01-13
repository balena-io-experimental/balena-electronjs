FROM resin/raspberrypi-systemd:latest

# Install apt deps
RUN apt-get update && apt-get install -y \
  apt-utils \
  xserver-xorg-core \
  xserver-xorg-input-all \
  xserver-xorg-video-fbdev \
  xorg \
  build-essential \
  clang \
  libdbus-1-dev \
  libgtk2.0-dev \
  libnotify-dev \
  libgnome-keyring-dev \
  libgconf2-dev \
  libasound2-dev \
  libcap-dev \
  libcups2-dev \
  libxtst-dev \
  libxss1 \
  libnss3-dev \
  fluxbox \
  libsmbclient \
  libssh-4 \
  python-dev \
  python-pip \
  build-essential \
  git \
  curl \
  psmisc \
  libraspberrypi0 \
  libpcre3 \
  fonts-freefont-ttf \
  fbset \
  bind9 \
  libdbus-1-dev \
  libexpat-dev \
  usbutils \
  && rm -rf /var/lib/apt/lists/*

# Set Xorg and FLUXBOX preferences
RUN mkdir ~/.fluxbox
RUN echo -e "xset s off\nxserver-command=X -s 0 dpms" > ~/.fluxbox/startup
RUN echo -e "#!/bin/sh\n\nexec /usr/bin/X -s 0 dpms -nolisten tcp "$@"" > /etc/X11/xinit/xserverrc

# Install nodejs
RUN curl -sL https://deb.nodesource.com/setup_4.x | sudo bash -
RUN apt-get install -y nodejs && npm config set unsafe-perm true

# Move Videocore Utils to the right place. These come from https://github.com/raspberrypi/firmware/tree/master/opt/vc/bin
COPY ./Dockerbin/opt/vc/bin /opt/vc/bin
RUN chmod +x /opt/vc/bin/* && echo 'export PATH=$PATH:/opt/vc/bin' >> ~/.bashrc

# Move package to filesystem
COPY ./package.json ./app/

# NPM i app
RUN npm i  --prefix /app

# Move app to filesystem
COPY . ./app

# Move to /app
WORKDIR /app

# Move to /
WORKDIR /

# Start app
CMD ["bash", "/app/start.sh"]
