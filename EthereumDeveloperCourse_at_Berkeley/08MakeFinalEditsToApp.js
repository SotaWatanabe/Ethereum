//App.js is where our front end app is rendered.
//Navigate to /greeterApp/greeterui/src/App.js

//Import the greeterContractvariable from EthereumSetup.js
//Set Constructor(props). Define super(props) and set a greet String state variable.

import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';

class App extends Component {
  render() {
    return (
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <h1 className="App-title">Welcome to React</h1>
        </header>
        <p className="App-intro">
          To get started, edit <code>src/App.js</code> and save to reload.
        </p>
      </div>
    );
  }
}

export default App;
