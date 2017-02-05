import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';

// https://github.com/electron/electron/issues/7300
// We don't want to bundle electron in the webpack process so we use it's globally exposed require method.
const electron = window.require('electron');
const fs = electron.remote.require('fs');
var files = fs.readdirSync('./');

class App extends Component {
  render() {
    return (
      <div className="App">
        <div className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <h2>Welcome to resin-electronjs-react</h2>
        </div>
        <div className="App-intro">
          <p>
          To get started, edit <code>src/App.js</code> and save to reload. You have access to all node apis. Here is a list of files in this directory.
          </p>
          {
            files.map((file, key) => {
              return <pre key={key}>{file}</pre>;
            })
          }
        </div>
      </div>
    );
  }
}

export default App;
