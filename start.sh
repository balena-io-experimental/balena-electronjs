#!/bin/bash

# using electron-prebuilt module instead of the global electron let's you
# easily control specific version dependency between your app and electron itself.
# the syntax below starts an X istance with ONLY our electronJS fired up,
# it saves you a LOT of resources avoiding full-desktops envs

while true; do
    rm /tmp/.X0-lock || true
    startx /app/node_modules/electron-prebuilt/dist/electron /app --enable-logging
done
