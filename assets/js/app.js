import React from 'react'
import ReactDOM from 'react-dom'
// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import resetCss from '../css/reset.css'
import css from "../css/app.css"

import Header from './components/Header/Header';
import Main from './components/Main/Main';

function App() {
  return (
    <div className="App">
      <Header />
      <Main />
    </div>
  );
}

ReactDOM.render(<App />, document.getElementById('mountPoint'))