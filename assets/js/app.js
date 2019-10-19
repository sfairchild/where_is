import React from 'react'
import ReactDOM from 'react-dom'
// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import resetCss from '../css/reset.css'
import css from "../css/app.css"

const ReactOnPhoenix = () => <div>This is a React Component!!!</div>

ReactDOM.render(<ReactOnPhoenix />, document.getElementById('mountPoint'))