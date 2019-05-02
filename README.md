# Balena Electronjs

a boilerplate for developing kiosks, digital signage or other human-machine interaction projects based on [ElectronJS](http://electron.atom.io/) and [balena](http://balena.io)

## Warning regarding armv6
This project does not currently support the armv6 architecture (ie Raspberry Pi 0 and 1) due to electron limitations. If the issue is fixed on the electron side, we will include it in this project. More on this [here](https://github.com/electron/electron/issues/4677)

## Getting started

- Sign up on [balena](https://dashboard.balena-cloud.com/signup)
- go throught the [getting started guide](https://www.balena.io/docs/learn/getting-started/raspberry-pi/nodejs/) and create a new application
- install the [balena-cli](https://github.com/balena-io/balena-cli) on your computer
- clone or download this repository to your local workspace
- `balena push <applicationName>`
- see the magic happening, your device is getting updated Over-The-Air!

## Configure via [environment variables](https://www.balena.io/docs/learn/manage/serv-vars/)
Variable Name | Value | Description | Device-specific
------------ | ------------- | ------------- | -------------
**`RESIN_HOST_CONFIG_gpu_mem`** | a value from `64` to `396` | the amount of RAM dedicated to the GPU | Raspberry Pi (all revs)

Apply the above settings in the "Fleet Configuration" panel (if applying it for the all devices withing your application), or "Device Configuration" panel (if applying it for a single device).

### WHY THIS TEMPLATE

Achieving kinda-smooth desktop application display on devices like the raspberrypi is hard. This project aims to provide a quickstart template.

### URL LAUNCHER config via ENV VARS
*__!!! Please note that since `0.1.0` the `bool`-based env vars dropped `true` / `false` strings in favour of `0` / `1` ones. !!!__*

simply set these [environment varables](https://www.balena.io/docs/learn/manage/serv-vars/) in your app via "Environment Variables" panel in the balena dashboard to configure the behaviour of your devices.

*__Please note that the `bool` type definition in the table is meant to accept to either `0` or `1` values.__*

* **`URL_LAUNCHER_URL`** *string* - the URL to be loaded. use `file:////usr/src/app/data/index.html` to load a local electronJS (or any website) app - *defaults to* `file:////usr/src/app/data/index.html`
* **`URL_LAUNCHER_NODE`** *bool* (converted from *string*) - whether or not enable nodejs - *defaults to* `0`
* **`URL_LAUNCHER_KIOSK`** *bool* (converted from *string*) - whether or not enter KIOSK mode - *defaults to* `1`
* **`URL_LAUNCHER_TITLE`** *string* - the title of the window. Seen only with `URL_LAUNCHER_FRAME`=`true` - *defaults to* `RESIN.IO`
* **`URL_LAUNCHER_FRAME`** *bool* (converted from *string*) - set to "true" to display the window frame. Seen only with `URL_LAUNCHER_KIOSK`=`false` - *defaults to*  `0`
* **`URL_LAUNCHER_CONSOLE`** *bool* (converted from *string*) - set to "true" to display the debug console -  *defaults to*  `0`
* **`URL_LAUNCHER_WIDTH`**  *int* (converted from *string*) -  - *defaults to* `1920`
* **`URL_LAUNCHER_HEIGHT`**  *int* (converted from *string*) -  - *defaults to* `1080`
* **`URL_LAUNCHER_TOUCH`** *bool* (converted from *string*) - enables touch events if your device supports them  - *defaults to* `0`
* **`URL_LAUNCHER_TOUCH_SIMULATE`** *bool* (converted from *string*) - simulates touch events - might be useful for touchscreen with partial driver support - be aware this could be a performance hog  - *defaults to* `0`
* **`URL_LAUNCHER_ZOOM`** *float* (converted from *string*) - The default zoom factor of the page, 3.0 represents 300%  - *defaults to* `1.0`
* **`URL_LAUNCHER_OVERLAY_SCROLLBARS`** *bool* (converted from *string*) - enables overlay scrollbars  - *defaults to* `0`
* **`TFT`** *bool* (converted from *string*) - sets the target display to TFT screen like the [piTFT](https://www.adafruit.com/product/1601) but still requires you to set the proper device tree overlay configuration for it  - *defaults to* `0`
* **`TFT_ROTATE`**  *int* (converted from *string*) - accepted values: 0,90,180,270 - *defaults to* `0`
* **`ELECTRON_ENABLE_HW_ACCELERATION`**  *bool* (converted from *string*) - enable hardware acceleration - *defaults to* `0`
* **`ELECTRON_BALENA_UPDATE_LOCK`**  *bool* (converted from *string*) - Enable supervisor update locking (see [Update Locking](#update-locking))
* **`ELECTRON_APP_DATA_DIR`**  *string* - Override the `appData` directory (see [Electron API Documentation: app](https://electronjs.org/docs/api/app#appgetpathname))
* **`ELECTRON_USER_DATA_DIR`**  *string* - Override the `userData` directory (see [Electron API Documentation: app](https://electronjs.org/docs/api/app#appgetpathname))

### Update Locking

**NOTE:** Take care to only listen for a response *once*, and avoid sending
multiple requests before the response arrived.

```js
const {ipcRenderer} = require('electron')
```

#### Acquiring the Lock

```js
// Listen for a response
ipcRenderer.once('balena-update-lock', (event, error) => {
  if (error) { ... }
})

// Send the 'lock' command to acquire the lock
ipcRenderer.send('balena-update-lock', 'lock')
```

#### Releasing the Lock

```js
// Listen for a response
ipcRenderer.once('balena-update-lock', (event, error) => {
  if (error) { ... }
})

// Send the 'unlock' command to release the lock
ipcRenderer.send('balena-update-lock', 'unlock')
```

#### Checking the Lock

```js
// Listen for a response
ipcRenderer.once('balena-update-lock', (event, error, isLocked) => {
  console.log('Locked:', error || isLocked)
})

// Send the 'check' command to check on the state of the lock
ipcRenderer.send('balena-update-lock', 'check')
```

### Related

- [resin-electronjs vue boilerplate](https://github.com/imomaliev/resin-electron-vue) by [@imomaliev](https://github.com/imomaliev)
- [balena-electronjs react boilerplate](https://github.com/balena-io-playground/balena-electronjs-react) by [@craig-mulligan](https://github.com/craig-mulligan)
