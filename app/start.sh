#!/bin/bash

# By default docker gives us 64MB of shared memory size but to display heavy
# pages we need more.
umount /dev/shm && mount -t tmpfs shm /dev/shm

# Set timezone
if [[ -n "$TIMEZONE" ]]
then
  # Check whether provided timezone is valid
  if [[ -e "/usr/share/zoneinfo/${TIMEZONE}" ]]
  then
    echo "Set timezone to ${TIMEZONE}."
    ln -sf "/usr/share/zoneinfo/${TIMEZONE}" /etc/localtime
  else
    echo "Invalid timezone: ${TIMEZONE}." >&2
  fi
fi

# using local electron module instead of the global electron lets you
# easily control specific version dependency between your app and electron itself.
# the syntax below starts an X istance with ONLY our electronJS fired up,
# it saves you a LOT of resources avoiding full-desktops envs

rm /tmp/.X0-lock &>/dev/null || true
startx /usr/src/app/node_modules/electron/dist/electron /usr/src/app --enable-logging
