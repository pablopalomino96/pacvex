import $ from 'jquery';
window.jQuery = $;
window.$ = $;

$(document).ready(function () {
    $("#active-content").fadeIn(1500);
    WelcomeWriter()
    sleep(2000).then(() => {
        $("#inner-content").fadeIn(2500);
        $("#footer").fadeIn(250);
    });
});

var i = 0;
var txt = "Welcome! I'm " + document.getElementById('name').innerText.split(' ')[0];
var speed = 90;

function WelcomeWriter() {
    if (i < txt.length) {
        document.getElementById('greeting').innerHTML += txt.charAt(i);
        i++;
        setTimeout(WelcomeWriter, speed);
    }
}

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}