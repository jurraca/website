// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from "../css/app.css"

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
const Particles = require("particlesjs");

window.onload = function() {
    Particles.init({
      selector: '.background',
      connectParticles: true,
      color: ["#2f2d41", "#37364e", "#063a4a", "#a95b0e", "#E16600", "#858585", "1f9ab3"],
      speed: 0.3,
      maxParticles: 136
    });
  };

