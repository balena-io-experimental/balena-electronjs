# resin-electronjs

### URL LAUNCHER config via ENV VARS

* **`URL_LAUNCHER_URL`** *string* - the URL to be loaded. use `file://app/index.hmtl` to load a local electronJS (or any website) app - *defaults to* `http://resin.io`
* **`URL_LAUNCHER_NODE`** *bool* (converted from *string*) - whether or not enable nodejs - *defaults to* `false`
* **`URL_LAUNCHER_KIOSK`** *bool* (converted from *string*) - whether or not enter KIOSK mode - *defaults to* `true`
* **`URL_LAUNCHER_TITLE`** *string* - the title of the window. Seen only with `URL_LAUNCHER_FRAME`=`true` - *defaults to* `RESIN.IO`
* **`URL_LAUNCHER_FRAME`** *bool* (converted from *string*) - set to "true" to display the window frame. Seen only with `URL_LAUNCHER_KIOSK`=`false` - *defaults to*  `false`
* **`URL_LAUNCHER_CONSOLE`** *bool* (converted from *string*) - set to "true" to display the debug console -  *defaults to*  `false`
* **`URL_LAUNCHER_WIDTH`**  *int* (converted from *string*) -  - *defaults to* `1920`
* **`URL_LAUNCHER_HEIGHT`**  *int* (converted from *string*) -  - *defaults to* `1080`
