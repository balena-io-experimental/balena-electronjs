// since we control the whole environment, we can safely use ES6 syntax:
const electron = require('electron');
const app = electron.app;
const BrowserWindow = electron.BrowserWindow;

// simple parameters initialization
var window = null;
var resin_toolbar = true;
var resin_kiosk = false;
var resin_node = true;

/*
  we initialize our application display as a callback of the electronJS "ready" event
*/
app.on('ready', function() {

    if (process.env.URL_LAUNCHER_FRAME && process.env.URL_LAUNCHER_FRAME === "false") {
      resin_toolbar = false;
    }
    if (process.env.URL_LAUNCHER_KIOSK && process.env.URL_LAUNCHER_KIOSK === "true") {
      resin_kiosk = true;
    }
    if (process.env.URL_LAUNCHER_NODE && process.env.URL_LAUNCHER_NODE === "false") {
      resin_node = false;
    }

    // here we actually configure the behavour of electronJS
    window = new BrowserWindow({
      width: parseInt(process.env.URL_LAUNCHER_WIDTH || 1920),
      height: parseInt(process.env.URL_LAUNCHER_HEIGHT || 1080),
      frame: resin_toolbar,
      title: process.env.URL_LAUNCHER_TITLE || "RESIN.IO",
      kiosk: resin_kiosk,
      webPreferences: {
        experimentalFeatures: true,
        overlayScrollbars: true,
        overlayFullscreenVideo: true,
        nodeIntegration: resin_node
      }
    });

    // if the env-var is set to true, a portion of the screen will be dedicated to the chrome-dev-tools
    if (process.env.URL_LAUNCHER_CONSOLE && process.env.URL_LAUNCHER_CONSOLE === "true") {
      window.openDevTools();
    }

    // the big red button, here we go
    window.loadURL(process.env.URL_LAUNCHER_URL || "http://resin.io");
});
