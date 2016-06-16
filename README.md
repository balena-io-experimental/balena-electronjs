![resin.io + electronJS = love](http://snappin.io/img/resin_electron_love.png)
# resin-electronjs

a boilerplate for developing kiosks, digital signage or other human-machine interaction projects based on [ElectronJS](http://electron.atom.io/) and [resin.io](http://resin.io)

This is the very basic layer on which [snappin.io](http://snappin.io) builds its touch-enabled apps.

### PRE-REQUISITES
this application is meant to be deployed to [RaspberryPi](https://www.raspberrypi.org/products/) devices via [resin.io](http://resin.io).

At least 64MB of GPU-dedicated RAM is required. You can achieve that locally following [these instructions](http://docs.resin.io/#/pages/hardware/i2c-and-spi.md#raspberry-pi-camera-module) (only the first parameter `gpu_mem=64` is required) or, __as we strongly suggest__, set it remotely with Resin's [Advanced Boot Configuration](http://docs.resin.io/#/pages/configuration/advanced.md#modifying-config-txt-remotely-) feature.

### WHY THIS TEMPLATE

Achieving kinda-smooth desktop application display on a raspberrypi is hard. This project aims to provide a quickstart template.

### WHY FLUXBOX

We did a lot of researches and tests with several window managers. [Fluxbox](http://fluxbox.org/) ended up being the most balanced between minimum footprint and features

### URL LAUNCHER config via ENV VARS

simply set these [environment varables](http://docs.resin.io/#/pages/management/env-vars.md) in your app via the resin dashboard to configure the behaviour of your devices

* **`URL_LAUNCHER_URL`** *string* - the URL to be loaded. use `file:///app/app/index.html` to load a local electronJS (or any website) app - *defaults to* `file:///app/app/index.html`
* **`URL_LAUNCHER_NODE`** *bool* (converted from *string*) - whether or not enable nodejs - *defaults to* `false`
* **`URL_LAUNCHER_KIOSK`** *bool* (converted from *string*) - whether or not enter KIOSK mode - *defaults to* `true`
* **`URL_LAUNCHER_TITLE`** *string* - the title of the window. Seen only with `URL_LAUNCHER_FRAME`=`true` - *defaults to* `RESIN.IO`
* **`URL_LAUNCHER_FRAME`** *bool* (converted from *string*) - set to "true" to display the window frame. Seen only with `URL_LAUNCHER_KIOSK`=`false` - *defaults to*  `false`
* **`URL_LAUNCHER_CONSOLE`** *bool* (converted from *string*) - set to "true" to display the debug console -  *defaults to*  `false`
* **`URL_LAUNCHER_WIDTH`**  *int* (converted from *string*) -  - *defaults to* `1920`
* **`URL_LAUNCHER_HEIGHT`**  *int* (converted from *string*) -  - *defaults to* `1080`
* **`URL_LAUNCHER_TOUCH`** *bool* (converted from *string*) - enables touch events if your device supports them  - *defaults to* `false`
* **`URL_LAUNCHER_TOUCH_SIMULATE`** *bool* (converted from *string*) - simulates touch events - might be useful for touchscreen with partial driver support - be aware this could be a performance hog  - *defaults to* `false`
