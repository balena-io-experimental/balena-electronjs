![resin.io + electronJS = love](http://snappin.io/img/resin_electron_love.png)
# resin-electronjs

a boilerplate for developing kiosks, digital signage or other human-machine interaction projects based on [ElectronJS](http://electron.atom.io/) and [resin.io](http://resin.io)

This is the very basic layer on which [snappin.io](http://snappin.io) builds its touch-enabled apps.

## Getting started

- Sign up on [resin.io](https://dashboard.resin.io/signup)
- go throught the [getting started guide](http://docs.resin.io/raspberrypi/nodejs/getting-started/) and create a new RPI zero application
- clone this repository to your local workspace
- add the _resin remote_ to your local workspace using the useful shortcut in the dashboard UI ![remoteadd](https://raw.githubusercontent.com/resin-io-playground/boombeastic/master/docs/gitresinremote.png)
- `git push resin master`
- see the magic happening, your device is getting updated Over-The-Air!

## Configure via [environment variables](https://docs.resin.io/management/env-vars/)
Variable Name | Value | Description | Device-specific
------------ | ------------- | ------------- | -------------
RESIN_HOST_CONFIG_gpu_mem | a value from `64` to `160` | the amount of RAM dedicated to the GPU | Raspberry Pi (all revs)

### WHY THIS TEMPLATE

Achieving kinda-smooth desktop application display on a devices like the raspberrypi is hard. This project aims to provide a quickstart template.

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
