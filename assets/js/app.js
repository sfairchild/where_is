import {Socket} from "phoenix";
import LiveSocket from "phoenix_live_view";
import resetCss from '../css/reset.css';
import css from '../css/app.css';

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"

import svgPanZoom from "svg-pan-zoom"

let Hooks = {}

Hooks.PanZoom = {
  mounted() {
    console.log('MOUNTED')
    svgPanZoom('#mainSvg')
  }
}

let liveSocket = new LiveSocket("/live", Socket, {hooks: Hooks})
liveSocket.connect()

