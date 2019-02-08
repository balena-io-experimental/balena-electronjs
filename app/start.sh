#!/bin/bash

# By default docker gives us 64MB of shared memory size but to display heavy
# pages we need more.
umount /dev/shm && mount -t tmpfs shm /dev/shm

# using local electron module instead of the global electron lets you
# easily control specific version dependency between your app and electron itself.
# the syntax below starts an X istance with ONLY our electronJS fired up,
# it saves you a LOT of resources avoiding full-desktops envs

rm /tmp/.X0-lock &>/dev/null || true
sed -i -e 's/console/anybody/g' /etc/X11/Xwrapper.config



#if [ ! -c /dev/fb1 ] && [ "$TFT" = "1" ]; then
#  modprobe spi-bcm2708 || true
#  modprobe fbtft_device name=pitft verbose=0 rotate=${TFT_ROTATE:-0} || true
#  sleep 1
#  mknod /dev/fb1 c $(cat /sys/class/graphics/fb1/dev | tr ':' ' ') || true
#  FRAMEBUFFER=/dev/fb1 startx /usr/src/app/node_modules/electron/dist/electron /usr/src/app --enable-logging
#else
#  startx /usr/src/app/node_modules/electron/dist/electron /usr/src/app --enable-logging
#fi

useradd test -m -s /bin/bash -G root
usermod -a -G root,tty test
echo "#!/bin/bash" > /home/test/xstart.sh
echo "chromium-browser --kiosk $URL_LAUNCHER_URL" >> /home/test/xstart.sh
chmod 770 /home/test/xstart.sh
chown test:test /home/test/xstart.sh


#su -c 'startx' test
su -c 'startx /home/test/xstart.sh' test
