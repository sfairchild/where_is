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
let pan

Hooks.PanZoom = {
  mounted() {
    pan = svgPanZoom('#mainSvg');
    console.log(pan)
  },
  updated() {
    pan.panBy({x: 0.01, y: 0.01})
  }
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

function customPanByZoomAtEnd(amount, endZoomLevel, animationTime){ // {x: 1, y: 2}
  if(typeof animationTime == "undefined"){
    animationTime =   300; // ms
  }
  var animationStepTime = 15 // one frame per 30 ms
    , animationSteps = animationTime / animationStepTime
    , animationStep = 0
    , intervalID = null
    , stepX = amount.x / animationSteps
    , stepY = amount.y / animationSteps;

  intervalID = setInterval(function(){
    if (animationStep++ < animationSteps) {
      panZoomInstance.panBy({x: stepX, y: stepY})
    } else {
      // Cancel interval
      if(typeof endZoomLevel != "undefined"){
        var viewPort = $(".svg-pan-zoom_viewport")[0];
        viewPort.style.transition = "all " + animationTime / 1000 + "s ease";
        panZoomInstance.zoom(endZoomLevel);
        setTimeout(function(){
          viewPort.style.transition = "none";
          $("svg")[0].style.pointerEvents = "all"; // re-enable the pointer events after auto-panning/zooming.
          panZoomInstance.enablePan();
          panZoomInstance.enableZoom();
          panZoomInstance.enableControlIcons();
          panZoomInstance.enableDblClickZoom();
          panZoomInstance.enableMouseWheelZoom();
        }, animationTime + 50);
      }
      clearInterval(intervalID)
    }
  }, animationStepTime)
}

function panToElem(targetElem) {

  var initialSizes = panZoomInstance.getSizes();
  var initialLoc = panZoomInstance.getPan();
  var initialBounds = targetElem.getBoundingClientRect();
  var initialZoom = panZoomInstance.getZoom();
  var initialCX = initialBounds.x + (initialBounds.width / 2);
  var initialCY = initialBounds.y + (initialBounds.height / 2);

  var dX = (initialSizes.width / 2) - initialCX;
  var dY = (initialSizes.height / 2) - initialCY;

  customPanByZoomAtEnd({x: dX, y: dY}, 2, 700);
}
