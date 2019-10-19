// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import {Socket} from "phoenix";
import LiveSocket from "phoenix_live_view";
import resetCss from '../css/reset.css';
import css from '../css/app.css';

let liveSocket = new LiveSocket("/live", Socket);
liveSocket.connect();
