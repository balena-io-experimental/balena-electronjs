###
# Build stage
##
FROM balenalib/%%BALENA_MACHINE_NAME%%-node:10-build as build

# Move to app dir
WORKDIR /usr/src/app

# Install build dependencies
RUN install_packages \
  apt-utils \
  clang \
  libxcb-image0 \
  libxcb-util0 \
  xdg-utils \
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
  libsmbclient \
  libssh-4 \
  libexpat-dev 

# Move package.json to filesystem
COPY ./app/package.json .

# Install npm modules for the application
RUN    JOBS=MAX npm install --unsafe-perm --production \
    && node_modules/.bin/electron-rebuild


###
# Runtime
##
FROM balenalib/%%BALENA_MACHINE_NAME%%-node:10-run

# Move to app dir
WORKDIR /usr/src/app

# Install runtime dependencies
RUN install_packages \
  xserver-xorg-core \
  xserver-xorg-input-all \
  xserver-xorg-video-fbdev \
  xorg \
  libxcb-image0 \
  libxcb-util0 \
  xdg-utils \
  libdbus-1-3 \
  libgtk2.0 \
  libnotify4 \
  libgnome-keyring0 \
  libgconf-2-4 \
  libasound2 \
  libcap2 \
  libcups2 \
  libxtst6 \
  libxss1 \
  libnss3 \
  libsmbclient \
  libssh-4 \
  fbset \
  libexpat1

RUN echo "#!/bin/bash" > /etc/X11/xinit/xserverrc \
  && echo "" >> /etc/X11/xinit/xserverrc \
  && echo 'exec /usr/bin/X -s 0 dpms -nocursor -nolisten tcp "$@"' >> /etc/X11/xinit/xserverrc

# Move app to filesystem
COPY ./app ./

# Copy the modules from the build step
COPY --from=build /usr/src/app/node_modules ./node_modules

# Start app
CMD ["bash", "/usr/src/app/start.sh"]
