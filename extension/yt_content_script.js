// remember these console.log() messages will be visible in DOM console, not extension console.

let vid = document.querySelector('video');

// output to scripts
// 
vid.addEventListener('pause', () => {
    chrome.runtime.sendMessage("pause", function (res) {
        if (chrome.runtime.lastError) {
            console.log("error during sendMessage from contentscript: "
                + JSON.stringify(chrome.runtime.lastError));
        }
    });
});

vid.addEventListener('play', () => {
    chrome.runtime.sendMessage("play", function (res) {
        if (chrome.runtime.lastError) {
            console.log("error during sendMessage from contentscript: "
                + JSON.stringify(chrome.runtime.lastError));
        }
    });
});

// input from scripts. This is todo:
chrome.runtime.onMessage.addListener((msg, sender, response) => {
    if (msg == "get_playback_state") {
        let state = isPaused();
        response(state);
    }
});

function isPaused() {
    return vid.paused();
}