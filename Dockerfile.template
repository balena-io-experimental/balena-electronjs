FROM resin/%%RESIN_MACHINE_NAME%%-node:latest

## uncomment if you want systemd
# ENV INITSYSTEM on

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
RUN echo "xset s off\nxserver-command=X -s 0 dpms" > ~/.fluxbox/startup
RUN echo "#!/bin/sh\n\nexec /usr/bin/X -s 0 dpms -nocursor -nolisten tcp "$@"" > /etc/X11/xinit/xserverrc

# Set npm
RUN npm config set unsafe-perm true

# Move package to filesystem
COPY ./package.json ./app/

# NPM i app
RUN npm i  --prefix /app


# Move app to filesystem
COPY . ./app

# NPM rebuild node native modules after electron is installed.
RUN ./app/node_modules/.bin/electron-rebuild

# Start app
CMD ["bash", "/app/start.sh"]
