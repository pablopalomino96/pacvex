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

// Import Bootstrap
import 'bootstrap'
// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"

import $ from 'jquery';
window.jQuery = $;
window.$ = $;
window.onscroll = function () {
    scrollFunction()
};

$(document).ready(function () {
    var wait = 0;

    $("#active-content").fadeIn(1500);
    if ($('#greeting').length > 0) {
        Greet();
        wait = 2000;
    }
    sleep(wait).then(() => {
        $("#inner-content").fadeIn(2500);
        $("#secondary-content").fadeIn(3000);
        $("#footer").fadeIn(250);
    });
});

function scrollFunction() {
    if (document.body.scrollTop > 50 || document.documentElement.scrollTop > 50) {
        $('#totop')[0].style.display = "block";
    } else {
        $('#totop')[0].style.display = "none";
    }
}

function Greet(name) {
    var txt = "Welcome! I'm " + document.getElementById('name').innerText.split(' ')[0];
    var i = 0;
    WelcomeWriter(txt, i);
}

function WelcomeWriter(txt, i) {
    if (i < txt.length) {
        document.getElementById('greeting').innerHTML += txt.charAt(i);
        i++;
        setTimeout(function () {
            WelcomeWriter(txt, i);
        }, 90);
    }
}

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}