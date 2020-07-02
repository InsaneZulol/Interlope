let vid = document.querySelector('video');

// output to scripts
// 
vid.addEventListener('pause', () => {
    chrome.runtime.sendMessage("pause");
});

vid.addEventListener('play', () => {
    chrome.runtime.sendMessage("play");
});
//

// input from scripts. This is todo:
chrome.runtime.onMessage.addListener((msg, sender, response) => {
    if (msg == "get_playback_state") {
        let state = isPaused();
        console.log("response: " + state);
        response(state);
    }
});

function isPaused() {
    return vid.paused();
}
//