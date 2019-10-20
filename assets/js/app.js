import {Socket} from "phoenix";
import LiveSocket from "phoenix_live_view";
import shuffle from 'lodash.shuffle';
import anime from 'animejs';
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

let Hooks = {};
let pan;

Hooks.PanZoom = {
  mounted() {
    pan = svgPanZoom('#mainSvg');
  },
  updated() {
    pan.panBy({x: 0.01, y: 0.01});
  },
};

Hooks.TitleName = {
  mounted() {
    const el = document.getElementById('titleName');
    const timer = 3000;
    const list = shuffle([
      'Randy', 'Jamal', 'Pedro', 'Jakob', 'Jane', 'L-a', 'Laurel', 'Yanny',
      'Paul', 'Collin', 'Andre', 'Waldo', 'Sarah', 'Rachel', 'Yazmin', 'Stephanie',
    ]);

    const getWrapper = name => {
      return name.replace(/\S/g, '<span class="letter">$&</span>');
    };

    // set initial name
    el.innerHTML = getWrapper(list[0] + '?');

    // change name every {timer} ms
    let i = 1;
    setInterval(() => {
      el.innerHTML = getWrapper(list[i] + '?');

      // animate name transition
      anime.timeline({loop: true})
        .add({
          targets: '.letter',
          scale: [0.3, 1],
          opacity: [0, 1],
          translateZ: 0,
          easing: "easeOutExpo",
          duration: timer,
          delay: (el, i) => 70 * (i+1)
        });

      if (i >= list.length - 1) i = 0;
      else ++i;
    }, timer);
  },
};

let liveSocket = new LiveSocket("/live", Socket, {hooks: Hooks})
liveSocket.connect()

