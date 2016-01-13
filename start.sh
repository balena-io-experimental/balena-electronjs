#!/bin/bash

# using electron-prebuilt module instead of the global electron let's you
# easily control specific version dependency between your app and electron itself.
# the syntax below starts an X istance with ONLY our electronJS fired up,
# it saves you a LOT of resources avoiding full-desktops envs

startx /app/node_modules/electron-prebuilt/dist/electron /app
